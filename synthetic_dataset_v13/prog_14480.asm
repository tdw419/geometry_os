; DESCRIPTION: Composite: Sets a single orange pixel at (437, 139) then Draws a black rectangle at (11, 56) with width 36 and height 80.
; PLAN: r0=437(x), r1=139(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=11(x), r6=56(y), r7=36(width), r8=80(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 139
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 11
LDI r6, 56
LDI r7, 36
LDI r8, 80
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
