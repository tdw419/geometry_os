; DESCRIPTION: Renders a blue line between points (388, 137) and (120, 156).
; PLAN: r0=388(x1), r1=137(y1), r2=120(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 137
LDI r2, 120
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
