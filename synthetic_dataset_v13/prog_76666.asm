; DESCRIPTION: Places a purple line segment connecting (205, 93) to (321, 245).
; PLAN: r0=205(x1), r1=93(y1), r2=321(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 93
LDI r2, 321
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
