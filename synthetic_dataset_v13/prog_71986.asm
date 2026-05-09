; DESCRIPTION: Renders a green line between points (483, 30) and (125, 123).
; PLAN: r0=483(x1), r1=30(y1), r2=125(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 30
LDI r2, 125
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
