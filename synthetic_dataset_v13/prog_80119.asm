; DESCRIPTION: Composite: Places a blue dot at position (388, 63) then Draws a black circle centered at (365, 59) with radius 12.
; PLAN: r0=388(x), r1=63(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=59(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 388
LDI r1, 63
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 365
LDI r6, 59
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
