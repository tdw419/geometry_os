; DESCRIPTION: Renders a green line between points (86, 140) and (136, 159).
; PLAN: r0=86(x1), r1=140(y1), r2=136(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 140
LDI r2, 136
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
