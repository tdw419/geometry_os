; DESCRIPTION: Places a purple line segment connecting (333, 182) to (458, 238).
; PLAN: r0=333(x1), r1=182(y1), r2=458(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 182
LDI r2, 458
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
