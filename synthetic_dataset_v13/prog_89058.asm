; DESCRIPTION: Composite: Places a blue circle of radius 79 at center (270, 112) then Sets a single black pixel at (461, 28).
; PLAN: r0=270(x), r1=112(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x), r6=28(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 112
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 28
LDI r7, 0x000000
PSET r5, r6, r7
HALT
