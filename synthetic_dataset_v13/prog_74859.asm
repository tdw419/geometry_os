; DESCRIPTION: Composite: Draws a black rectangle at (289, 203) with width 48 and height 31 then Renders a green disk with center (126, 155) and radius 70.
; PLAN: r0=289(x), r1=203(y), r2=48(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x), r6=155(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 203
LDI r2, 48
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 155
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
