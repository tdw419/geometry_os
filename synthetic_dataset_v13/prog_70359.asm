; DESCRIPTION: Composite: Draws a blue circle centered at (350, 113) with radius 67 then Places a yellow dot at position (493, 185).
; PLAN: r0=350(x), r1=113(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=493(x), r6=185(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 113
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 493
LDI r6, 185
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
