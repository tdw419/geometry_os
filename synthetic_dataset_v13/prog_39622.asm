; DESCRIPTION: Renders a purple line between points (159, 237) and (207, 184).
; PLAN: r0=159(x1), r1=237(y1), r2=207(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 237
LDI r2, 207
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
