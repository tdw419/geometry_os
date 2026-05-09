; DESCRIPTION: Composite: Places a purple dot at position (337, 155) then Places a magenta circle of radius 44 at center (326, 112).
; PLAN: r0=337(x), r1=155(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=112(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 337
LDI r1, 155
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 326
LDI r6, 112
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
