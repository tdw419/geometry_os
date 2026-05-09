; DESCRIPTION: Draws a black line from (199, 199) to (366, 136).
; PLAN: r0=199(x1), r1=199(y1), r2=366(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 199
LDI r2, 366
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
