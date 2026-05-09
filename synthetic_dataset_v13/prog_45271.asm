; DESCRIPTION: Draws a blue line from (204, 85) to (221, 223).
; PLAN: r0=204(x1), r1=85(y1), r2=221(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 85
LDI r2, 221
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
