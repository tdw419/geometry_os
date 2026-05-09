; DESCRIPTION: Composite: Renders a magenta disk with center (55, 131) and radius 22 then Sets a single yellow pixel at (159, 195).
; PLAN: r0=55(x), r1=131(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=195(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 55
LDI r1, 131
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 195
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
