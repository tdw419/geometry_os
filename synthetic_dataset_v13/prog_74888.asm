; DESCRIPTION: Composite: Creates a black rectangular region at (268, 71) spanning 116 by 73 pixels then Places a blue circle of radius 74 at center (197, 135).
; PLAN: r0=268(x), r1=71(y), r2=116(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=135(y), r7=74(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 268
LDI r1, 71
LDI r2, 116
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 135
LDI r7, 74
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
