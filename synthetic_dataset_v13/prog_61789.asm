; DESCRIPTION: Renders a blue line between points (114, 156) and (191, 29).
; PLAN: r0=114(x1), r1=156(y1), r2=191(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 156
LDI r2, 191
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
