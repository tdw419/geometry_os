; DESCRIPTION: Renders a blue line between points (13, 156) and (245, 175).
; PLAN: r0=13(x1), r1=156(y1), r2=245(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 156
LDI r2, 245
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
