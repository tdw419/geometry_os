; DESCRIPTION: Composite: Creates a white rectangular region at (364, 127) spanning 105 by 31 pixels then Draws a black circle centered at (25, 142) with radius 19.
; PLAN: r0=364(x), r1=127(y), r2=105(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=25(x), r6=142(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 364
LDI r1, 127
LDI r2, 105
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 142
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
