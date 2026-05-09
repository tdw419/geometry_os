; DESCRIPTION: Composite: Creates a purple rectangular region at (404, 68) spanning 94 by 112 pixels then Sets a single blue pixel at (142, 95) then Renders a black line between points (157, 179) and (230, 169).
; PLAN: r0=404(x), r1=68(y), r2=94(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x), r6=95(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=157(x1), r11=179(y1), r12=230(x2), r13=169(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 68
LDI r2, 94
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 95
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 157
LDI r11, 179
LDI r12, 230
LDI r13, 169
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
