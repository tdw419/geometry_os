; DESCRIPTION: Draws a blue line from (277, 189) to (287, 200).
; PLAN: r0=277(x1), r1=189(y1), r2=287(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 189
LDI r2, 287
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
