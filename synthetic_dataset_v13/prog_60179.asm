; DESCRIPTION: Composite: Creates a green rectangular region at (195, 49) spanning 94 by 31 pixels then Renders a blue line between points (121, 145) and (446, 218) then Renders a yellow disk with center (381, 92) and radius 56.
; PLAN: r0=195(x), r1=49(y), r2=94(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x1), r6=145(y1), r7=446(x2), r8=218(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=381(x), r11=92(y), r12=56(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 195
LDI r1, 49
LDI r2, 94
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 145
LDI r7, 446
LDI r8, 218
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 92
LDI r12, 56
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
