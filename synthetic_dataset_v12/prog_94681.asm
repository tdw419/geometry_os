; DESCRIPTION: Composite: Draws a green rectangle at (396, 144) with width 58 and height 48 then Draws a black circle centered at (114, 104) with radius 57.
; PLAN: r0=396(x), r1=144(y), r2=58(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=104(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 396
LDI r1, 144
LDI r2, 58
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 104
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
