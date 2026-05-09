; DESCRIPTION: Draws a blue line from (142, 31) to (159, 191).
; PLAN: r0=142(x1), r1=31(y1), r2=159(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 31
LDI r2, 159
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
