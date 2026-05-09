; DESCRIPTION: Composite: Places a magenta circle of radius 25 at center (448, 175) then Places a purple dot at position (91, 51).
; PLAN: r0=448(x), r1=175(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x), r6=51(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 448
LDI r1, 175
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 51
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
