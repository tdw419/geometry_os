; DESCRIPTION: Composite: Places a orange dot at position (453, 104) then Draws a purple rectangle at (18, 66) with width 31 and height 101 then Places a yellow circle of radius 73 at center (216, 137).
; PLAN: r0=453(x), r1=104(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=18(x), r6=66(y), r7=31(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=216(x), r11=137(y), r12=73(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 104
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 18
LDI r6, 66
LDI r7, 31
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 137
LDI r12, 73
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
