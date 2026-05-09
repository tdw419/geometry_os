; DESCRIPTION: Composite: Places a black circle of radius 24 at center (185, 151) then Places a magenta dot at position (190, 145).
; PLAN: r0=185(x), r1=151(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x), r6=145(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 151
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 145
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
