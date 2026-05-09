; DESCRIPTION: Composite: Draws a green rectangle at (367, 204) with width 117 and height 15 then Draws a blue circle centered at (121, 130) with radius 55.
; PLAN: r0=367(x), r1=204(y), r2=117(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x), r6=130(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 367
LDI r1, 204
LDI r2, 117
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 130
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
