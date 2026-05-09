; DESCRIPTION: Renders a purple line between points (500, 190) and (324, 45).
; PLAN: r0=500(x1), r1=190(y1), r2=324(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 190
LDI r2, 324
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
