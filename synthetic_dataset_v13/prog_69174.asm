; DESCRIPTION: Places a purple line segment connecting (98, 218) to (481, 243).
; PLAN: r0=98(x1), r1=218(y1), r2=481(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 218
LDI r2, 481
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
