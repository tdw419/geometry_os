; DESCRIPTION: Composite: Draws a blue rectangle at (325, 63) with width 40 and height 53 then Sets a single blue pixel at (90, 41).
; PLAN: r0=325(x), r1=63(y), r2=40(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x), r6=41(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 63
LDI r2, 40
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 41
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
