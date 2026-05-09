; DESCRIPTION: Composite: Renders a red line between points (500, 140) and (74, 171) then Sets a single yellow pixel at (188, 142) then Creates a green rectangular region at (229, 76) spanning 112 by 116 pixels.
; PLAN: r0=500(x1), r1=140(y1), r2=74(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=142(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=229(x), r11=76(y), r12=112(width), r13=116(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 500
LDI r1, 140
LDI r2, 74
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 142
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 229
LDI r11, 76
LDI r12, 112
LDI r13, 116
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
