; DESCRIPTION: Composite: Creates a purple rectangular region at (213, 15) spanning 69 by 70 pixels then Creates a yellow circular shape at (246, 155) with radius 70.
; PLAN: r0=213(x), r1=15(y), r2=69(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=155(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 213
LDI r1, 15
LDI r2, 69
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 155
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
