; DESCRIPTION: Renders a purple line between points (271, 111) and (251, 85).
; PLAN: r0=271(x1), r1=111(y1), r2=251(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 111
LDI r2, 251
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
