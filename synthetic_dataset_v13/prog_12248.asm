; DESCRIPTION: Composite: Creates a purple rectangular region at (163, 26) spanning 22 by 116 pixels then Draws a red circle centered at (100, 60) with radius 33.
; PLAN: r0=163(x), r1=26(y), r2=22(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=60(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 163
LDI r1, 26
LDI r2, 22
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 60
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
