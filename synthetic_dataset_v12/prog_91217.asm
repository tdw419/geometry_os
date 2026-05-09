; DESCRIPTION: Renders a magenta line between points (208, 134) and (84, 77).
; PLAN: r0=208(x1), r1=134(y1), r2=84(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 134
LDI r2, 84
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
