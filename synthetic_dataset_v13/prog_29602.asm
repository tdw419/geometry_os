; DESCRIPTION: Composite: Creates a red rectangular region at (134, 143) spanning 37 by 105 pixels then Draws a green circle centered at (379, 95) with radius 61.
; PLAN: r0=134(x), r1=143(y), r2=37(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x), r6=95(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 134
LDI r1, 143
LDI r2, 37
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 95
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
