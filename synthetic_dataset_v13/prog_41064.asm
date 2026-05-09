; DESCRIPTION: Composite: Places a black circle of radius 70 at center (159, 138) then Sets a single yellow pixel at (38, 162).
; PLAN: r0=159(x), r1=138(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=162(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 159
LDI r1, 138
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 162
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
