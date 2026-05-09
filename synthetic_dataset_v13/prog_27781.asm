; DESCRIPTION: Composite: Places a black line segment connecting (120, 96) to (76, 184) then Sets a single yellow pixel at (311, 229).
; PLAN: r0=120(x1), r1=96(y1), r2=76(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=229(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 96
LDI r2, 76
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 229
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
