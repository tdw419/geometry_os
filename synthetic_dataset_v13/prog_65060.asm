; DESCRIPTION: Composite: Draws a black rectangle at (422, 157) with width 63 and height 93 then Draws a black circle centered at (125, 145) with radius 74.
; PLAN: r0=422(x), r1=157(y), r2=63(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=145(y), r7=74(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 157
LDI r2, 63
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 145
LDI r7, 74
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
