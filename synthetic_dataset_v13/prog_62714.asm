; DESCRIPTION: Draws a blue line from (137, 181) to (277, 67).
; PLAN: r0=137(x1), r1=181(y1), r2=277(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 181
LDI r2, 277
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
