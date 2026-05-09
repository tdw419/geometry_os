; DESCRIPTION: Renders a magenta line between points (157, 93) and (357, 78).
; PLAN: r0=157(x1), r1=93(y1), r2=357(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 93
LDI r2, 357
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
