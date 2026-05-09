; DESCRIPTION: Renders a purple line between points (434, 79) and (357, 177).
; PLAN: r0=434(x1), r1=79(y1), r2=357(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 79
LDI r2, 357
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
