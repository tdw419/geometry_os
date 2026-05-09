; DESCRIPTION: Composite: Places a yellow dot at position (136, 122) then Draws a blue circle centered at (232, 199) with radius 56.
; PLAN: r0=136(x), r1=122(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=232(x), r6=199(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 136
LDI r1, 122
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 232
LDI r6, 199
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
