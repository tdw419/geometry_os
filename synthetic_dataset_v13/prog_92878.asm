; DESCRIPTION: Composite: Draws a black circle centered at (173, 106) with radius 43 then Creates a yellow rectangular region at (82, 116) spanning 43 by 45 pixels then Renders a purple line between points (311, 163) and (157, 97).
; PLAN: r0=173(x), r1=106(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x), r6=116(y), r7=43(width), r8=45(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x1), r11=163(y1), r12=157(x2), r13=97(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 106
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 116
LDI r7, 43
LDI r8, 45
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 163
LDI r12, 157
LDI r13, 97
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
