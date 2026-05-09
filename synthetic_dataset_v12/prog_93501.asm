; DESCRIPTION: Composite: Renders a blue box of size 83x80 starting at (244, 135) then Sets a single blue pixel at (259, 205) then Renders a yellow line between points (442, 227) and (148, 138).
; PLAN: r0=244(x), r1=135(y), r2=83(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x), r6=205(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=442(x1), r11=227(y1), r12=148(x2), r13=138(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 135
LDI r2, 83
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 205
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 442
LDI r11, 227
LDI r12, 148
LDI r13, 138
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
