; DESCRIPTION: Composite: Creates a black circular shape at (426, 113) with radius 30 then Draws a magenta rectangle at (412, 125) with width 56 and height 90.
; PLAN: r0=426(x), r1=113(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x), r6=125(y), r7=56(width), r8=90(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 113
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 125
LDI r7, 56
LDI r8, 90
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
