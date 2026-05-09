; DESCRIPTION: Composite: Places a orange line segment connecting (432, 8) to (414, 187) then Renders a yellow disk with center (287, 130) and radius 79 then Creates a purple rectangular region at (245, 6) spanning 14 by 86 pixels.
; PLAN: r0=432(x1), r1=8(y1), r2=414(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=130(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x), r11=6(y), r12=14(width), r13=86(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 8
LDI r2, 414
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 130
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 6
LDI r12, 14
LDI r13, 86
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
