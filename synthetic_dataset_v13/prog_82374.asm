; DESCRIPTION: Draws a blue line from (454, 54) to (277, 230).
; PLAN: r0=454(x1), r1=54(y1), r2=277(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 54
LDI r2, 277
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
