; DESCRIPTION: Composite: Renders a green line between points (343, 151) and (161, 80) then Sets a single yellow pixel at (222, 18).
; PLAN: r0=343(x1), r1=151(y1), r2=161(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=18(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 343
LDI r1, 151
LDI r2, 161
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 18
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
