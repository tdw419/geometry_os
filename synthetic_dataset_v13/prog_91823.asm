; DESCRIPTION: Renders a purple line between points (229, 15) and (300, 200).
; PLAN: r0=229(x1), r1=15(y1), r2=300(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 15
LDI r2, 300
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
