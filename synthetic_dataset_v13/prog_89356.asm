; DESCRIPTION: Composite: Renders a white box of size 100x105 starting at (119, 3) then Draws a yellow circle centered at (267, 165) with radius 16.
; PLAN: r0=119(x), r1=3(y), r2=100(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=165(y), r7=16(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 119
LDI r1, 3
LDI r2, 100
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 165
LDI r7, 16
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
