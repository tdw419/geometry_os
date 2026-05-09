; DESCRIPTION: Composite: Places a yellow circle of radius 66 at center (212, 151) then Places a purple dot at position (17, 219).
; PLAN: r0=212(x), r1=151(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x), r6=219(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 151
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 219
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
