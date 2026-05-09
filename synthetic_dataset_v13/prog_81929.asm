; DESCRIPTION: Renders a purple line between points (509, 15) and (21, 200).
; PLAN: r0=509(x1), r1=15(y1), r2=21(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 15
LDI r2, 21
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
