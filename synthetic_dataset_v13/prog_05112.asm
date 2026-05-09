; DESCRIPTION: Composite: Creates a black circular shape at (184, 156) with radius 65 then Draws a blue rectangle at (0, 95) with width 106 and height 20 then Sets a single black pixel at (30, 197).
; PLAN: r0=184(x), r1=156(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=95(y), r7=106(width), r8=20(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=30(x), r11=197(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 156
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 95
LDI r7, 106
LDI r8, 20
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 197
LDI r12, 0x000000
PSET r10, r11, r12
HALT
