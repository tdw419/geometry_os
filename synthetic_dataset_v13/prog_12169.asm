; DESCRIPTION: Renders a purple line between points (407, 70) and (430, 48).
; PLAN: r0=407(x1), r1=70(y1), r2=430(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 70
LDI r2, 430
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
