; DESCRIPTION: Renders a purple line between points (159, 220) and (340, 79).
; PLAN: r0=159(x1), r1=220(y1), r2=340(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 220
LDI r2, 340
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
