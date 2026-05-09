; DESCRIPTION: Composite: Creates a red rectangular region at (138, 97) spanning 104 by 108 pixels then Creates a magenta circular shape at (51, 179) with radius 35.
; PLAN: r0=138(x), r1=97(y), r2=104(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x), r6=179(y), r7=35(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 97
LDI r2, 104
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 179
LDI r7, 35
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
