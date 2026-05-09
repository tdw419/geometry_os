; DESCRIPTION: Places a purple line segment connecting (26, 221) to (477, 40).
; PLAN: r0=26(x1), r1=221(y1), r2=477(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 221
LDI r2, 477
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
