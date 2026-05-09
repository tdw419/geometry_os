; DESCRIPTION: Renders a purple line between points (112, 234) and (79, 134).
; PLAN: r0=112(x1), r1=234(y1), r2=79(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 234
LDI r2, 79
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
