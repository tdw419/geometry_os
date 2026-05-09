; DESCRIPTION: Composite: Creates a blue circular shape at (157, 32) with radius 24 then Creates a black rectangular region at (377, 72) spanning 86 by 78 pixels then Renders a blue line between points (452, 39) and (484, 114).
; PLAN: r0=157(x), r1=32(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=72(y), r7=86(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=452(x1), r11=39(y1), r12=484(x2), r13=114(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 32
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 72
LDI r7, 86
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 39
LDI r12, 484
LDI r13, 114
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
