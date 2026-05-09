; DESCRIPTION: Composite: Renders a blue line between points (298, 79) and (53, 190) then Places a purple dot at position (257, 185).
; PLAN: r0=298(x1), r1=79(y1), r2=53(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=185(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 298
LDI r1, 79
LDI r2, 53
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 185
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
