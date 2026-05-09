; DESCRIPTION: Draws a blue line from (501, 127) to (453, 241).
; PLAN: r0=501(x1), r1=127(y1), r2=453(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 127
LDI r2, 453
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
