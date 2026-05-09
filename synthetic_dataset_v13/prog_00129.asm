; DESCRIPTION: Renders a blue line between points (357, 229) and (406, 32).
; PLAN: r0=357(x1), r1=229(y1), r2=406(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 229
LDI r2, 406
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
