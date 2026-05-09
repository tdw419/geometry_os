; DESCRIPTION: Renders a blue line between points (409, 219) and (410, 129).
; PLAN: r0=409(x1), r1=219(y1), r2=410(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 219
LDI r2, 410
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
