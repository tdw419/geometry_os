; DESCRIPTION: Composite: Creates a white rectangular region at (13, 90) spanning 82 by 24 pixels then Draws a black circle centered at (40, 174) with radius 40.
; PLAN: r0=13(x), r1=90(y), r2=82(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x), r6=174(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 13
LDI r1, 90
LDI r2, 82
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 174
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
