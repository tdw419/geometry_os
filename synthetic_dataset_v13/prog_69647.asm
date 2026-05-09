; DESCRIPTION: Renders a magenta line between points (7, 159) and (431, 70).
; PLAN: r0=7(x1), r1=159(y1), r2=431(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 159
LDI r2, 431
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
