; DESCRIPTION: Renders a blue line between points (497, 44) and (378, 218).
; PLAN: r0=497(x1), r1=44(y1), r2=378(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 44
LDI r2, 378
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
