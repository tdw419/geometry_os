; DESCRIPTION: Draws a blue line from (55, 125) to (469, 136).
; PLAN: r0=55(x1), r1=125(y1), r2=469(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 125
LDI r2, 469
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
