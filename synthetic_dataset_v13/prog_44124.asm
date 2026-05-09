; DESCRIPTION: Renders a green line between points (287, 219) and (99, 203).
; PLAN: r0=287(x1), r1=219(y1), r2=99(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 219
LDI r2, 99
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
