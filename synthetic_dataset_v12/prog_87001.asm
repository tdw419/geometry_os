; DESCRIPTION: Draws a blue line from (453, 85) to (3, 104).
; PLAN: r0=453(x1), r1=85(y1), r2=3(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 85
LDI r2, 3
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
