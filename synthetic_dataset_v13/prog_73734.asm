; DESCRIPTION: Composite: Creates a black rectangular region at (338, 114) spanning 29 by 67 pixels then Draws a purple circle centered at (308, 87) with radius 74.
; PLAN: r0=338(x), r1=114(y), r2=29(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x), r6=87(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 338
LDI r1, 114
LDI r2, 29
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 87
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
