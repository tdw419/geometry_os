; DESCRIPTION: Draws a purple line from (363, 210) to (357, 124).
; PLAN: r0=363(x1), r1=210(y1), r2=357(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 210
LDI r2, 357
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
