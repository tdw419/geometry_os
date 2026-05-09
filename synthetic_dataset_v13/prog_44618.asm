; DESCRIPTION: Renders a blue line between points (272, 124) and (357, 53).
; PLAN: r0=272(x1), r1=124(y1), r2=357(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 124
LDI r2, 357
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
