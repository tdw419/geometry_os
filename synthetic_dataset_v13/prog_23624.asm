; DESCRIPTION: Composite: Draws a magenta circle centered at (32, 210) with radius 11 then Places a red dot at position (397, 87).
; PLAN: r0=32(x), r1=210(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=87(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 32
LDI r1, 210
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 87
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
