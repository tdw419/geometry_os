; DESCRIPTION: Renders a green line between points (79, 232) and (56, 140).
; PLAN: r0=79(x1), r1=232(y1), r2=56(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 232
LDI r2, 56
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
