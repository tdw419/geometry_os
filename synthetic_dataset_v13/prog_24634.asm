; DESCRIPTION: Renders a purple line between points (359, 30) and (265, 184).
; PLAN: r0=359(x1), r1=30(y1), r2=265(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 30
LDI r2, 265
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
