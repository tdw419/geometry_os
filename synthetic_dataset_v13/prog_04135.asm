; DESCRIPTION: Renders a white line between points (347, 219) and (314, 160).
; PLAN: r0=347(x1), r1=219(y1), r2=314(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 219
LDI r2, 314
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
