; DESCRIPTION: Renders a magenta line between points (133, 77) and (68, 233).
; PLAN: r0=133(x1), r1=77(y1), r2=68(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 77
LDI r2, 68
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
