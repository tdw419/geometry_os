; DESCRIPTION: Draws a blue line from (381, 11) to (416, 140).
; PLAN: r0=381(x1), r1=11(y1), r2=416(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 11
LDI r2, 416
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
