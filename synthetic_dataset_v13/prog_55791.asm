; DESCRIPTION: Composite: Places a magenta circle of radius 75 at center (212, 171) then Sets a single black pixel at (397, 51).
; PLAN: r0=212(x), r1=171(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=51(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 171
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 51
LDI r7, 0x000000
PSET r5, r6, r7
HALT
