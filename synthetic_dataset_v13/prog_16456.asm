; DESCRIPTION: Composite: Places a red line segment connecting (180, 90) to (476, 143) then Places a blue dot at position (361, 156).
; PLAN: r0=180(x1), r1=90(y1), r2=476(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=156(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 180
LDI r1, 90
LDI r2, 476
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 156
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
