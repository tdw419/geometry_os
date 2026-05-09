; DESCRIPTION: Renders a black line between points (219, 99) and (409, 200).
; PLAN: r0=219(x1), r1=99(y1), r2=409(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 99
LDI r2, 409
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
