; DESCRIPTION: Places a purple line segment connecting (460, 107) to (149, 238).
; PLAN: r0=460(x1), r1=107(y1), r2=149(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 107
LDI r2, 149
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
