; DESCRIPTION: Composite: Creates a purple rectangular region at (248, 144) spanning 103 by 35 pixels then Places a purple circle of radius 27 at center (157, 204) then Places a black line segment connecting (40, 216) to (232, 226).
; PLAN: r0=248(x), r1=144(y), r2=103(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=204(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x1), r11=216(y1), r12=232(x2), r13=226(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 144
LDI r2, 103
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 204
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 216
LDI r12, 232
LDI r13, 226
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
