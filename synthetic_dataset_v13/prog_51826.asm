; DESCRIPTION: Draws a black line from (140, 25) to (419, 185).
; PLAN: r0=140(x1), r1=25(y1), r2=419(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 25
LDI r2, 419
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
