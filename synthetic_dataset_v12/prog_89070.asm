; DESCRIPTION: Composite: Creates a white rectangular region at (55, 34) spanning 46 by 15 pixels then Draws a green circle centered at (44, 86) with radius 41.
; PLAN: r0=55(x), r1=34(y), r2=46(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x), r6=86(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 55
LDI r1, 34
LDI r2, 46
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 86
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
