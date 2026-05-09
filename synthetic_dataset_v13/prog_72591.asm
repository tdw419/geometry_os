; DESCRIPTION: Draws a blue line from (491, 137) to (111, 133).
; PLAN: r0=491(x1), r1=137(y1), r2=111(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 137
LDI r2, 111
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
