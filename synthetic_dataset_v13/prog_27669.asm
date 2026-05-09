; DESCRIPTION: Renders a magenta line between points (138, 218) and (24, 84).
; PLAN: r0=138(x1), r1=218(y1), r2=24(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 218
LDI r2, 24
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
