; DESCRIPTION: Renders a magenta line between points (31, 195) and (357, 114).
; PLAN: r0=31(x1), r1=195(y1), r2=357(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 195
LDI r2, 357
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
