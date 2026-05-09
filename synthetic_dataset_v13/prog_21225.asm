; DESCRIPTION: Composite: Places a blue circle of radius 23 at center (158, 32) then Sets a single red pixel at (316, 198) then Renders a green box of size 112x84 starting at (370, 162).
; PLAN: r0=158(x), r1=32(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=198(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=370(x), r11=162(y), r12=112(width), r13=84(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 32
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 198
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 370
LDI r11, 162
LDI r12, 112
LDI r13, 84
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
