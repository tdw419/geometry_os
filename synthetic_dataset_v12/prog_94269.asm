; DESCRIPTION: Draws a blue line from (125, 125) to (287, 105).
; PLAN: r0=125(x1), r1=125(y1), r2=287(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 125
LDI r2, 287
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
