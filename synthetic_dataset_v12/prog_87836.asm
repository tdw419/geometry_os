; DESCRIPTION: Composite: Draws a green circle centered at (233, 136) with radius 79 then Places a magenta dot at position (426, 114).
; PLAN: r0=233(x), r1=136(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x), r6=114(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 233
LDI r1, 136
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 114
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
