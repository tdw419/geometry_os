; DESCRIPTION: Renders a blue line between points (357, 91) and (177, 77).
; PLAN: r0=357(x1), r1=91(y1), r2=177(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 91
LDI r2, 177
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
