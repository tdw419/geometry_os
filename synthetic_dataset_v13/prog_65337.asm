; DESCRIPTION: Composite: Places a magenta line segment connecting (98, 118) to (162, 31) then Places a yellow 107x19 rectangle at position (332, 87) then Creates a blue circular shape at (402, 124) with radius 74.
; PLAN: r0=98(x1), r1=118(y1), r2=162(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=87(y), r7=107(width), r8=19(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=402(x), r11=124(y), r12=74(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 98
LDI r1, 118
LDI r2, 162
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 87
LDI r7, 107
LDI r8, 19
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 124
LDI r12, 74
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
