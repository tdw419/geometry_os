; DESCRIPTION: Composite: Places a blue 60x90 rectangle at position (49, 130) then Renders a green disk with center (183, 136) and radius 56.
; PLAN: r0=49(x), r1=130(y), r2=60(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=136(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 130
LDI r2, 60
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 136
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
