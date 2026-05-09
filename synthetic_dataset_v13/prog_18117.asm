; DESCRIPTION: Composite: Draws a yellow rectangle at (440, 212) with width 52 and height 28 then Renders a green disk with center (490, 85) and radius 15.
; PLAN: r0=440(x), r1=212(y), r2=52(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=85(y), r7=15(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 440
LDI r1, 212
LDI r2, 52
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 85
LDI r7, 15
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
