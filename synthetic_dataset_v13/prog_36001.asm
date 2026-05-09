; DESCRIPTION: Renders a purple line between points (363, 205) and (437, 23).
; PLAN: r0=363(x1), r1=205(y1), r2=437(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 205
LDI r2, 437
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
