; DESCRIPTION: Renders a magenta line between points (77, 98) and (353, 181).
; PLAN: r0=77(x1), r1=98(y1), r2=353(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 98
LDI r2, 353
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
