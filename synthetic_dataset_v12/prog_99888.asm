; DESCRIPTION: Composite: Renders a black line between points (133, 45) and (245, 235) then Draws a red circle centered at (355, 147) with radius 79 then Renders a cyan box of size 14x112 starting at (338, 116).
; PLAN: r0=133(x1), r1=45(y1), r2=245(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=147(y), r7=79(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x), r11=116(y), r12=14(width), r13=112(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 45
LDI r2, 245
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 147
LDI r7, 79
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 116
LDI r12, 14
LDI r13, 112
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
