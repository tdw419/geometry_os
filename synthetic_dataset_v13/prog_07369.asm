; DESCRIPTION: Renders a blue line between points (136, 23) and (66, 91).
; PLAN: r0=136(x1), r1=23(y1), r2=66(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 23
LDI r2, 66
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
