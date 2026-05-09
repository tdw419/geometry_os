; DESCRIPTION: Renders a green line between points (109, 232) and (8, 66).
; PLAN: r0=109(x1), r1=232(y1), r2=8(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 232
LDI r2, 8
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
