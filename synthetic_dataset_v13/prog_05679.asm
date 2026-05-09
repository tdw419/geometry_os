; DESCRIPTION: Composite: Creates a black rectangular region at (172, 157) spanning 119 by 49 pixels then Creates a cyan circular shape at (267, 155) with radius 44.
; PLAN: r0=172(x), r1=157(y), r2=119(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=155(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 157
LDI r2, 119
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 155
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
