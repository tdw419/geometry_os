; DESCRIPTION: Renders a green line between points (125, 86) and (159, 114).
; PLAN: r0=125(x1), r1=86(y1), r2=159(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 86
LDI r2, 159
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
