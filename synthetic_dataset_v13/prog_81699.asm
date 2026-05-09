; DESCRIPTION: Renders a green line between points (409, 26) and (78, 14).
; PLAN: r0=409(x1), r1=26(y1), r2=78(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 26
LDI r2, 78
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
