; DESCRIPTION: Renders a black line between points (357, 124) and (222, 112).
; PLAN: r0=357(x1), r1=124(y1), r2=222(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 124
LDI r2, 222
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
