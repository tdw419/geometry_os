; DESCRIPTION: Draws a blue line from (219, 174) to (273, 227).
; PLAN: r0=219(x1), r1=174(y1), r2=273(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 174
LDI r2, 273
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
