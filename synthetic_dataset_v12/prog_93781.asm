; DESCRIPTION: Composite: Places a purple circle of radius 32 at center (408, 158) then Places a magenta dot at position (385, 238).
; PLAN: r0=408(x), r1=158(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=238(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 408
LDI r1, 158
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 238
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
