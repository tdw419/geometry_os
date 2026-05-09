; DESCRIPTION: Renders a magenta line between points (357, 119) and (432, 91).
; PLAN: r0=357(x1), r1=119(y1), r2=432(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 119
LDI r2, 432
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
