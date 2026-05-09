; DESCRIPTION: Composite: Renders a purple line between points (171, 132) and (32, 162) then Sets a single orange pixel at (189, 141).
; PLAN: r0=171(x1), r1=132(y1), r2=32(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=141(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 171
LDI r1, 132
LDI r2, 32
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 141
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
