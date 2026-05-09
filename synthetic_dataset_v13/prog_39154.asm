; DESCRIPTION: Composite: Creates a black circular shape at (236, 157) with radius 80 then Creates a magenta rectangular region at (439, 186) spanning 29 by 67 pixels then Renders a blue line between points (418, 239) and (272, 185).
; PLAN: r0=236(x), r1=157(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=186(y), r7=29(width), r8=67(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x1), r11=239(y1), r12=272(x2), r13=185(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 157
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 186
LDI r7, 29
LDI r8, 67
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 239
LDI r12, 272
LDI r13, 185
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
