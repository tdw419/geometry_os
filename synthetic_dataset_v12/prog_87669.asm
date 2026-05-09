; DESCRIPTION: Places a purple line segment connecting (242, 40) to (389, 82).
; PLAN: r0=242(x1), r1=40(y1), r2=389(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 40
LDI r2, 389
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
