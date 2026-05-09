; DESCRIPTION: Composite: Draws a purple rectangle at (284, 95) with width 43 and height 111 then Draws a black circle centered at (254, 150) with radius 12 then Sets a single blue pixel at (159, 39).
; PLAN: r0=284(x), r1=95(y), r2=43(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=150(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=159(x), r11=39(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 284
LDI r1, 95
LDI r2, 43
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 150
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 159
LDI r11, 39
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
