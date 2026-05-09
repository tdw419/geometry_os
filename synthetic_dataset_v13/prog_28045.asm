; DESCRIPTION: Draws a blue line from (471, 184) to (251, 160).
; PLAN: r0=471(x1), r1=184(y1), r2=251(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 184
LDI r2, 251
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
