; DESCRIPTION: Composite: Draws a white rectangle at (165, 141) with width 13 and height 87 then Renders a white disk with center (407, 181) and radius 72.
; PLAN: r0=165(x), r1=141(y), r2=13(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=181(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 165
LDI r1, 141
LDI r2, 13
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 181
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
