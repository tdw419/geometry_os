; DESCRIPTION: Renders a green line between points (496, 33) and (77, 159).
; PLAN: r0=496(x1), r1=33(y1), r2=77(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 33
LDI r2, 77
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
