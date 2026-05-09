; DESCRIPTION: Composite: Creates a black rectangular region at (265, 87) spanning 117 by 98 pixels then Creates a blue circular shape at (423, 134) with radius 55.
; PLAN: r0=265(x), r1=87(y), r2=117(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=134(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 265
LDI r1, 87
LDI r2, 117
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 134
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
