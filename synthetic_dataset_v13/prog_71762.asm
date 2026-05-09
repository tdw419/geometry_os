; DESCRIPTION: Draws a blue line from (471, 112) to (325, 171).
; PLAN: r0=471(x1), r1=112(y1), r2=325(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 112
LDI r2, 325
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
