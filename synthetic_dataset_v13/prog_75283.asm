; DESCRIPTION: Draws a blue line from (314, 76) to (464, 56).
; PLAN: r0=314(x1), r1=76(y1), r2=464(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 76
LDI r2, 464
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
