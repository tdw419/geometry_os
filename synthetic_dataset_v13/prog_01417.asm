; DESCRIPTION: Renders a magenta line between points (388, 19) and (353, 66).
; PLAN: r0=388(x1), r1=19(y1), r2=353(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 19
LDI r2, 353
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
