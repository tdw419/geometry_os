; DESCRIPTION: Composite: Creates a yellow rectangular region at (195, 112) spanning 112 by 89 pixels then Creates a magenta circular shape at (62, 74) with radius 36 then Renders a black line between points (486, 64) and (374, 88).
; PLAN: r0=195(x), r1=112(y), r2=112(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x), r6=74(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x1), r11=64(y1), r12=374(x2), r13=88(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 112
LDI r2, 112
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 74
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 64
LDI r12, 374
LDI r13, 88
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
