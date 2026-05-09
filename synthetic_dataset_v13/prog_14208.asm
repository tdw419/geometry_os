; DESCRIPTION: Renders a purple line between points (75, 85) and (330, 142).
; PLAN: r0=75(x1), r1=85(y1), r2=330(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 85
LDI r2, 330
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
