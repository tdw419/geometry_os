; DESCRIPTION: Renders a blue line between points (315, 252) and (66, 218).
; PLAN: r0=315(x1), r1=252(y1), r2=66(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 252
LDI r2, 66
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
