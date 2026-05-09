; DESCRIPTION: Renders a blue line between points (357, 71) and (166, 103).
; PLAN: r0=357(x1), r1=71(y1), r2=166(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 71
LDI r2, 166
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
