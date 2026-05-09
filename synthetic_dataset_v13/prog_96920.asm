; DESCRIPTION: Composite: Renders a green box of size 27x110 starting at (476, 75) then Creates a blue circular shape at (129, 74) with radius 17 then Renders a blue line between points (137, 101) and (466, 70).
; PLAN: r0=476(x), r1=75(y), r2=27(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=74(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=137(x1), r11=101(y1), r12=466(x2), r13=70(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 476
LDI r1, 75
LDI r2, 27
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 74
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 137
LDI r11, 101
LDI r12, 466
LDI r13, 70
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
