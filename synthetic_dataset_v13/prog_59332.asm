; DESCRIPTION: Composite: Draws a blue circle centered at (93, 211) with radius 17 then Draws a magenta rectangle at (314, 54) with width 109 and height 57.
; PLAN: r0=93(x), r1=211(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=54(y), r7=109(width), r8=57(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 211
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 54
LDI r7, 109
LDI r8, 57
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
