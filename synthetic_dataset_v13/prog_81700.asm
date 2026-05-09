; DESCRIPTION: Renders a blue line between points (508, 97) and (145, 18).
; PLAN: r0=508(x1), r1=97(y1), r2=145(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 97
LDI r2, 145
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
