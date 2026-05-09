; DESCRIPTION: Composite: Draws a blue circle centered at (338, 108) with radius 14 then Sets a single black pixel at (274, 198).
; PLAN: r0=338(x), r1=108(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x), r6=198(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 338
LDI r1, 108
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 198
LDI r7, 0x000000
PSET r5, r6, r7
HALT
