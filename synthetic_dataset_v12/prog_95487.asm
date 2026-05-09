; DESCRIPTION: Composite: Places a orange line segment connecting (362, 98) to (19, 118) then Sets a single blue pixel at (415, 207).
; PLAN: r0=362(x1), r1=98(y1), r2=19(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=207(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 98
LDI r2, 19
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 207
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
