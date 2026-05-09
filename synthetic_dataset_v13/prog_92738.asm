; DESCRIPTION: Composite: Draws a magenta circle centered at (292, 176) with radius 46 then Places a red dot at position (402, 238).
; PLAN: r0=292(x), r1=176(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=238(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 176
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 238
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
