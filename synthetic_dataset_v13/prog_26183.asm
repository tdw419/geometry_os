; DESCRIPTION: Renders a purple line between points (4, 71) and (23, 49).
; PLAN: r0=4(x1), r1=71(y1), r2=23(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 71
LDI r2, 23
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
