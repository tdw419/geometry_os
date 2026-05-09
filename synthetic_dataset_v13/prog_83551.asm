; DESCRIPTION: Renders a green line between points (203, 183) and (159, 125).
; PLAN: r0=203(x1), r1=183(y1), r2=159(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 183
LDI r2, 159
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
