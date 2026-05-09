; DESCRIPTION: Renders a purple line between points (71, 40) and (28, 226).
; PLAN: r0=71(x1), r1=40(y1), r2=28(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 40
LDI r2, 28
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
