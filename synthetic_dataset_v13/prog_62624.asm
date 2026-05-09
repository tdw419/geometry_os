; DESCRIPTION: Composite: Draws a green rectangle at (136, 122) with width 111 and height 44 then Creates a blue circular shape at (182, 174) with radius 65.
; PLAN: r0=136(x), r1=122(y), r2=111(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=174(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 136
LDI r1, 122
LDI r2, 111
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 174
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
