; DESCRIPTION: Composite: Renders a blue box of size 112x29 starting at (134, 64) then Places a yellow circle of radius 11 at center (417, 199) then Places a orange line segment connecting (162, 193) to (203, 160).
; PLAN: r0=134(x), r1=64(y), r2=112(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x), r6=199(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x1), r11=193(y1), r12=203(x2), r13=160(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 64
LDI r2, 112
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 199
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 193
LDI r12, 203
LDI r13, 160
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
