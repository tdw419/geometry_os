; DESCRIPTION: Composite: Creates a black rectangular region at (367, 10) spanning 106 by 116 pixels then Creates a magenta circular shape at (156, 137) with radius 53.
; PLAN: r0=367(x), r1=10(y), r2=106(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=137(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 367
LDI r1, 10
LDI r2, 106
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 137
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
