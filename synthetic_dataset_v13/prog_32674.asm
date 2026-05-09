; DESCRIPTION: Composite: Draws a yellow circle centered at (448, 157) with radius 63 then Places a yellow dot at position (382, 83).
; PLAN: r0=448(x), r1=157(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=83(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 448
LDI r1, 157
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 83
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
