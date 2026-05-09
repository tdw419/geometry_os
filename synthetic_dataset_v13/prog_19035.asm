; DESCRIPTION: Composite: Draws a yellow circle centered at (130, 105) with radius 79 then Places a magenta dot at position (467, 206).
; PLAN: r0=130(x), r1=105(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=467(x), r6=206(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 105
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 467
LDI r6, 206
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
