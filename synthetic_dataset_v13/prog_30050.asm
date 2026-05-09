; DESCRIPTION: Composite: Places a cyan line segment connecting (148, 186) to (109, 132) then Sets a single yellow pixel at (15, 141).
; PLAN: r0=148(x1), r1=186(y1), r2=109(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=15(x), r6=141(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 148
LDI r1, 186
LDI r2, 109
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 141
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
