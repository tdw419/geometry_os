; DESCRIPTION: Renders a magenta line between points (122, 109) and (423, 79).
; PLAN: r0=122(x1), r1=109(y1), r2=423(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 109
LDI r2, 423
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
