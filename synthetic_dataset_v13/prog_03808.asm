; DESCRIPTION: Renders a purple line between points (324, 252) and (409, 103).
; PLAN: r0=324(x1), r1=252(y1), r2=409(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 252
LDI r2, 409
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
