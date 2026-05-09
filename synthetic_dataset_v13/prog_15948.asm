; DESCRIPTION: Composite: Draws a magenta rectangle at (318, 169) with width 83 and height 44 then Draws a blue circle centered at (335, 172) with radius 20.
; PLAN: r0=318(x), r1=169(y), r2=83(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x), r6=172(y), r7=20(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 318
LDI r1, 169
LDI r2, 83
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 172
LDI r7, 20
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
