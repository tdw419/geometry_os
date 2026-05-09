; DESCRIPTION: Composite: Creates a blue rectangular region at (283, 24) spanning 111 by 89 pixels then Renders a white line between points (371, 164) and (481, 236) then Creates a black circular shape at (452, 136) with radius 56.
; PLAN: r0=283(x), r1=24(y), r2=111(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x1), r6=164(y1), r7=481(x2), r8=236(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=452(x), r11=136(y), r12=56(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 283
LDI r1, 24
LDI r2, 111
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 164
LDI r7, 481
LDI r8, 236
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 136
LDI r12, 56
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
