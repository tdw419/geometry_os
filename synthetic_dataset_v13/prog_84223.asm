; DESCRIPTION: Draws a orange line from (142, 97) to (483, 180).
; PLAN: r0=142(x1), r1=97(y1), r2=483(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 97
LDI r2, 483
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
