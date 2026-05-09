; DESCRIPTION: Composite: Creates a black rectangular region at (336, 212) spanning 38 by 21 pixels then Draws a blue circle centered at (122, 193) with radius 53 then Draws a magenta line from (343, 138) to (139, 180).
; PLAN: r0=336(x), r1=212(y), r2=38(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=193(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=343(x1), r11=138(y1), r12=139(x2), r13=180(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 212
LDI r2, 38
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 193
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 343
LDI r11, 138
LDI r12, 139
LDI r13, 180
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
