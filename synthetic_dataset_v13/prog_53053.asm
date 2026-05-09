; DESCRIPTION: Renders a purple line between points (44, 165) and (38, 51).
; PLAN: r0=44(x1), r1=165(y1), r2=38(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 165
LDI r2, 38
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
