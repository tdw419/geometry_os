; DESCRIPTION: Composite: Draws a purple line from (505, 118) to (225, 194) then Sets a single black pixel at (420, 76).
; PLAN: r0=505(x1), r1=118(y1), r2=225(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=76(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 505
LDI r1, 118
LDI r2, 225
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 76
LDI r7, 0x000000
PSET r5, r6, r7
HALT
