; DESCRIPTION: Draws a black line from (448, 230) to (89, 191).
; PLAN: r0=448(x1), r1=230(y1), r2=89(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 230
LDI r2, 89
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
