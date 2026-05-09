; DESCRIPTION: Composite: Draws a red circle centered at (299, 188) with radius 54 then Draws a magenta rectangle at (155, 136) with width 117 and height 73.
; PLAN: r0=299(x), r1=188(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x), r6=136(y), r7=117(width), r8=73(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 188
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 136
LDI r7, 117
LDI r8, 73
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
