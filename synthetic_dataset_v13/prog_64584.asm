; DESCRIPTION: Composite: Draws a green rectangle at (56, 68) with width 62 and height 91 then Renders a blue disk with center (148, 132) and radius 62.
; PLAN: r0=56(x), r1=68(y), r2=62(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x), r6=132(y), r7=62(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 56
LDI r1, 68
LDI r2, 62
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 132
LDI r7, 62
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
