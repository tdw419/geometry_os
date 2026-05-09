; DESCRIPTION: Draws a blue line from (335, 25) to (204, 2).
; PLAN: r0=335(x1), r1=25(y1), r2=204(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 25
LDI r2, 204
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
