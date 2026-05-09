; DESCRIPTION: Renders a purple line between points (357, 82) and (63, 152).
; PLAN: r0=357(x1), r1=82(y1), r2=63(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 82
LDI r2, 63
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
