; DESCRIPTION: Draws a black line from (390, 51) to (199, 13).
; PLAN: r0=390(x1), r1=51(y1), r2=199(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 51
LDI r2, 199
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
