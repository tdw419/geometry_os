; DESCRIPTION: Renders a blue line between points (203, 180) and (409, 62).
; PLAN: r0=203(x1), r1=180(y1), r2=409(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 180
LDI r2, 409
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
