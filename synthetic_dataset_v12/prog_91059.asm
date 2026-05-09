; DESCRIPTION: Composite: Creates a green rectangular region at (244, 137) spanning 108 by 104 pixels then Places a blue dot at position (116, 105) then Draws a yellow line from (471, 84) to (227, 115).
; PLAN: r0=244(x), r1=137(y), r2=108(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=105(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=471(x1), r11=84(y1), r12=227(x2), r13=115(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 137
LDI r2, 108
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 105
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 471
LDI r11, 84
LDI r12, 227
LDI r13, 115
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
