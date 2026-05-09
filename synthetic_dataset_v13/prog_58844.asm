; DESCRIPTION: Composite: Creates a black circular shape at (179, 213) with radius 21 then Creates a black rectangular region at (397, 101) spanning 79 by 40 pixels.
; PLAN: r0=179(x), r1=213(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=101(y), r7=79(width), r8=40(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 213
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 101
LDI r7, 79
LDI r8, 40
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
