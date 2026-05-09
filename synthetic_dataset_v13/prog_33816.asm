; DESCRIPTION: Composite: Sets a single orange pixel at (483, 36) then Renders a white box of size 100x55 starting at (243, 198).
; PLAN: r0=483(x), r1=36(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=198(y), r7=100(width), r8=55(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 36
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 243
LDI r6, 198
LDI r7, 100
LDI r8, 55
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
