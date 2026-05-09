; DESCRIPTION: Composite: Renders a red line between points (414, 11) and (447, 105) then Creates a purple circular shape at (43, 51) with radius 33 then Renders a green box of size 40x95 starting at (242, 135).
; PLAN: r0=414(x1), r1=11(y1), r2=447(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=51(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=242(x), r11=135(y), r12=40(width), r13=95(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 11
LDI r2, 447
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 51
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 242
LDI r11, 135
LDI r12, 40
LDI r13, 95
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
