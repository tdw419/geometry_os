; DESCRIPTION: Composite: Draws a purple rectangle at (325, 52) with width 94 and height 117 then Draws a black circle centered at (199, 151) with radius 41.
; PLAN: r0=325(x), r1=52(y), r2=94(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=151(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 325
LDI r1, 52
LDI r2, 94
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 151
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
