; DESCRIPTION: Draws a blue line from (91, 171) to (250, 110).
; PLAN: r0=91(x1), r1=171(y1), r2=250(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 171
LDI r2, 250
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
