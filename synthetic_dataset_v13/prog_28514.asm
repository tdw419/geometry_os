; DESCRIPTION: Composite: Places a purple line segment connecting (496, 76) to (476, 229) then Places a white dot at position (146, 151).
; PLAN: r0=496(x1), r1=76(y1), r2=476(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=151(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 496
LDI r1, 76
LDI r2, 476
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 151
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
