; DESCRIPTION: Composite: Creates a yellow rectangular region at (22, 81) spanning 62 by 117 pixels then Places a blue circle of radius 66 at center (287, 87).
; PLAN: r0=22(x), r1=81(y), r2=62(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x), r6=87(y), r7=66(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 22
LDI r1, 81
LDI r2, 62
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 87
LDI r7, 66
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
