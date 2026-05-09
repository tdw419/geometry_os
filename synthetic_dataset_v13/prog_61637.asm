; DESCRIPTION: Composite: Places a black dot at position (347, 129) then Draws a blue circle centered at (388, 84) with radius 47.
; PLAN: r0=347(x), r1=129(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=84(y), r7=47(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 347
LDI r1, 129
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 388
LDI r6, 84
LDI r7, 47
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
