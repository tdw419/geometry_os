; DESCRIPTION: Composite: Draws a white rectangle at (257, 97) with width 17 and height 24 then Renders a purple line between points (98, 48) and (497, 62).
; PLAN: r0=257(x), r1=97(y), r2=17(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x1), r6=48(y1), r7=497(x2), r8=62(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 97
LDI r2, 17
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 48
LDI r7, 497
LDI r8, 62
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
