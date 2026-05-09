; DESCRIPTION: Composite: Creates a black rectangular region at (244, 139) spanning 39 by 14 pixels then Draws a magenta circle centered at (306, 123) with radius 14.
; PLAN: r0=244(x), r1=139(y), r2=39(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=123(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 244
LDI r1, 139
LDI r2, 39
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 123
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
