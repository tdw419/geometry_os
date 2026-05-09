; DESCRIPTION: Draws a purple line from (467, 225) to (159, 226).
; PLAN: r0=467(x1), r1=225(y1), r2=159(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 225
LDI r2, 159
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
