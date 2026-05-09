; DESCRIPTION: Renders a blue line between points (357, 19) and (195, 1).
; PLAN: r0=357(x1), r1=19(y1), r2=195(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 19
LDI r2, 195
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
