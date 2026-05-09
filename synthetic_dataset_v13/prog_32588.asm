; DESCRIPTION: Composite: Renders a magenta disk with center (402, 213) and radius 12 then Draws a white rectangle at (467, 8) with width 13 and height 17.
; PLAN: r0=402(x), r1=213(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=467(x), r6=8(y), r7=13(width), r8=17(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 213
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 467
LDI r6, 8
LDI r7, 13
LDI r8, 17
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
