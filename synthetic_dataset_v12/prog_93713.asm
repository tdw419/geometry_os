; DESCRIPTION: Places a purple line segment connecting (358, 26) to (481, 221).
; PLAN: r0=358(x1), r1=26(y1), r2=481(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 26
LDI r2, 481
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
