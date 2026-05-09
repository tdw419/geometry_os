; DESCRIPTION: Draws a purple line from (458, 23) to (274, 99).
; PLAN: r0=458(x1), r1=23(y1), r2=274(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 23
LDI r2, 274
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
