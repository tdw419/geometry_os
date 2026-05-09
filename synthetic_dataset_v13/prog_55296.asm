; DESCRIPTION: Composite: Draws a white rectangle at (232, 144) with width 73 and height 53 then Places a black circle of radius 31 at center (447, 153) then Renders a blue line between points (336, 76) and (337, 58).
; PLAN: r0=232(x), r1=144(y), r2=73(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=153(y), r7=31(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=336(x1), r11=76(y1), r12=337(x2), r13=58(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 144
LDI r2, 73
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 153
LDI r7, 31
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 336
LDI r11, 76
LDI r12, 337
LDI r13, 58
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
