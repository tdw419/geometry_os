; DESCRIPTION: Composite: Renders a purple line between points (191, 204) and (171, 39) then Sets a single yellow pixel at (88, 206) then Draws a red rectangle at (141, 60) with width 30 and height 79.
; PLAN: r0=191(x1), r1=204(y1), r2=171(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=206(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=141(x), r11=60(y), r12=30(width), r13=79(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 204
LDI r2, 171
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 206
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 141
LDI r11, 60
LDI r12, 30
LDI r13, 79
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
