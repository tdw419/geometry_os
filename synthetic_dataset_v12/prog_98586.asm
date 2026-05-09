; DESCRIPTION: Renders a purple line between points (262, 47) and (165, 130).
; PLAN: r0=262(x1), r1=47(y1), r2=165(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 47
LDI r2, 165
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
