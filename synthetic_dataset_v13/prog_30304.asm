; DESCRIPTION: Renders a green line between points (145, 132) and (448, 105).
; PLAN: r0=145(x1), r1=132(y1), r2=448(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 132
LDI r2, 448
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
