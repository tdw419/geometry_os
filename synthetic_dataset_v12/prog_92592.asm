; DESCRIPTION: Composite: Places a purple circle of radius 51 at center (451, 85) then Places a magenta line segment connecting (166, 161) to (157, 206) then Renders a yellow box of size 30x52 starting at (428, 130).
; PLAN: r0=451(x), r1=85(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x1), r6=161(y1), r7=157(x2), r8=206(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=428(x), r11=130(y), r12=30(width), r13=52(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 85
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 161
LDI r7, 157
LDI r8, 206
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 130
LDI r12, 30
LDI r13, 52
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
