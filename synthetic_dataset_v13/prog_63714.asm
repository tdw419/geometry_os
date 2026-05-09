; DESCRIPTION: Renders a purple line between points (174, 92) and (109, 138).
; PLAN: r0=174(x1), r1=92(y1), r2=109(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 92
LDI r2, 109
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
