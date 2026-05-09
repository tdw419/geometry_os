; DESCRIPTION: Renders a magenta line between points (176, 202) and (357, 185).
; PLAN: r0=176(x1), r1=202(y1), r2=357(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 202
LDI r2, 357
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
