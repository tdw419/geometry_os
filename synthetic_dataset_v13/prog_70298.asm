; DESCRIPTION: Renders a purple line between points (140, 90) and (399, 152).
; PLAN: r0=140(x1), r1=90(y1), r2=399(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 90
LDI r2, 399
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
