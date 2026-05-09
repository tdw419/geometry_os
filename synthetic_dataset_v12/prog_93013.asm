; DESCRIPTION: Composite: Sets a single yellow pixel at (172, 124) then Draws a black rectangle at (205, 7) with width 29 and height 22.
; PLAN: r0=172(x), r1=124(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=7(y), r7=29(width), r8=22(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 124
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 205
LDI r6, 7
LDI r7, 29
LDI r8, 22
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
