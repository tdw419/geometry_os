; DESCRIPTION: Composite: Creates a red rectangular region at (76, 97) spanning 48 by 108 pixels then Draws a black circle centered at (388, 81) with radius 53.
; PLAN: r0=76(x), r1=97(y), r2=48(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=81(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 76
LDI r1, 97
LDI r2, 48
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 81
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
