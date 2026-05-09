; DESCRIPTION: Composite: Places a purple line segment connecting (393, 75) to (139, 196) then Places a blue 50x71 rectangle at position (293, 56) then Draws a orange circle centered at (430, 210) with radius 46.
; PLAN: r0=393(x1), r1=75(y1), r2=139(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=56(y), r7=50(width), r8=71(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=430(x), r11=210(y), r12=46(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 75
LDI r2, 139
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 56
LDI r7, 50
LDI r8, 71
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 210
LDI r12, 46
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
