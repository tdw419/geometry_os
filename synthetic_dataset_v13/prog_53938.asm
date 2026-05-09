; DESCRIPTION: Composite: Creates a blue rectangular region at (371, 41) spanning 81 by 97 pixels then Draws a green circle centered at (310, 166) with radius 59.
; PLAN: r0=371(x), r1=41(y), r2=81(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=166(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 371
LDI r1, 41
LDI r2, 81
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 166
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
