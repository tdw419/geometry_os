; DESCRIPTION: Draws a blue line from (270, 183) to (385, 169).
; PLAN: r0=270(x1), r1=183(y1), r2=385(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 183
LDI r2, 385
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
