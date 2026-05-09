; DESCRIPTION: Composite: Renders a magenta disk with center (374, 111) and radius 35 then Draws a green rectangle at (201, 5) with width 78 and height 87.
; PLAN: r0=374(x), r1=111(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=5(y), r7=78(width), r8=87(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 111
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 5
LDI r7, 78
LDI r8, 87
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
