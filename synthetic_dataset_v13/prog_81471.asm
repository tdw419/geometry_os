; DESCRIPTION: Composite: Creates a magenta rectangular region at (217, 116) spanning 29 by 95 pixels then Creates a green circular shape at (177, 89) with radius 35.
; PLAN: r0=217(x), r1=116(y), r2=29(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x), r6=89(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 217
LDI r1, 116
LDI r2, 29
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 89
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
