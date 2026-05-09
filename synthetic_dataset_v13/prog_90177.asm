; DESCRIPTION: Composite: Renders a blue box of size 56x22 starting at (73, 127) then Creates a purple circular shape at (409, 160) with radius 66 then Places a yellow line segment connecting (124, 239) to (390, 102).
; PLAN: r0=73(x), r1=127(y), r2=56(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=160(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=124(x1), r11=239(y1), r12=390(x2), r13=102(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 127
LDI r2, 56
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 160
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 124
LDI r11, 239
LDI r12, 390
LDI r13, 102
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
