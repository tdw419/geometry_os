; DESCRIPTION: Composite: Creates a magenta rectangular region at (286, 55) spanning 114 by 29 pixels then Creates a red circular shape at (292, 142) with radius 11.
; PLAN: r0=286(x), r1=55(y), r2=114(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x), r6=142(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 55
LDI r2, 114
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 142
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
