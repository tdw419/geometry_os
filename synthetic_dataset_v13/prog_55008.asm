; DESCRIPTION: Renders a magenta line between points (367, 118) and (379, 84).
; PLAN: r0=367(x1), r1=118(y1), r2=379(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 118
LDI r2, 379
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
