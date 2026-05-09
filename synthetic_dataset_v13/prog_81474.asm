; DESCRIPTION: Renders a blue line between points (357, 194) and (290, 68).
; PLAN: r0=357(x1), r1=194(y1), r2=290(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 194
LDI r2, 290
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
