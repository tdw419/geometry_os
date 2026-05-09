; DESCRIPTION: Places a purple line segment connecting (309, 50) to (345, 77).
; PLAN: r0=309(x1), r1=50(y1), r2=345(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 50
LDI r2, 345
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
