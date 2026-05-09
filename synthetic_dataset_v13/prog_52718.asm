; DESCRIPTION: Composite: Places a blue dot at position (165, 155) then Draws a purple circle centered at (254, 90) with radius 60.
; PLAN: r0=165(x), r1=155(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=90(y), r7=60(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 165
LDI r1, 155
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 254
LDI r6, 90
LDI r7, 60
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
