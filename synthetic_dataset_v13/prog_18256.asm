; DESCRIPTION: Places a purple line segment connecting (180, 113) to (98, 119).
; PLAN: r0=180(x1), r1=113(y1), r2=98(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 113
LDI r2, 98
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
