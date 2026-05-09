; DESCRIPTION: Composite: Draws a magenta circle centered at (292, 121) with radius 58 then Places a blue dot at position (311, 80).
; PLAN: r0=292(x), r1=121(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=80(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 121
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 80
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
