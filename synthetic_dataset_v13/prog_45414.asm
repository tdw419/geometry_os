; DESCRIPTION: Renders a white line between points (409, 77) and (159, 155).
; PLAN: r0=409(x1), r1=77(y1), r2=159(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 77
LDI r2, 159
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
