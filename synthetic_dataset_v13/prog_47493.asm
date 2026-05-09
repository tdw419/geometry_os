; DESCRIPTION: Composite: Renders a purple line between points (22, 211) and (341, 171) then Creates a green rectangular region at (212, 109) spanning 76 by 86 pixels then Renders a black disk with center (412, 178) and radius 10.
; PLAN: r0=22(x1), r1=211(y1), r2=341(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=212(x), r6=109(y), r7=76(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=412(x), r11=178(y), r12=10(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 22
LDI r1, 211
LDI r2, 341
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 109
LDI r7, 76
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 178
LDI r12, 10
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
