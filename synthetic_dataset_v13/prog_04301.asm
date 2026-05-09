; DESCRIPTION: Places a blue line segment connecting (266, 185) to (106, 176).
; PLAN: r0=266(x1), r1=185(y1), r2=106(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 185
LDI r2, 106
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
