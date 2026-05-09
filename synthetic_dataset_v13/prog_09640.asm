; DESCRIPTION: Composite: Draws a green rectangle at (147, 94) with width 89 and height 80 then Renders a orange disk with center (131, 154) and radius 78.
; PLAN: r0=147(x), r1=94(y), r2=89(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=154(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 147
LDI r1, 94
LDI r2, 89
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 154
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
