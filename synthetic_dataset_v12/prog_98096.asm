; DESCRIPTION: Composite: Draws a blue circle centered at (363, 218) with radius 13 then Draws a purple rectangle at (267, 89) with width 74 and height 109.
; PLAN: r0=363(x), r1=218(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=89(y), r7=74(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 218
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 89
LDI r7, 74
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
