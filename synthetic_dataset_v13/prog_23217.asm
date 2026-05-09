; DESCRIPTION: Draws a blue line from (133, 223) to (133, 18).
; PLAN: r0=133(x1), r1=223(y1), r2=133(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 223
LDI r2, 133
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
