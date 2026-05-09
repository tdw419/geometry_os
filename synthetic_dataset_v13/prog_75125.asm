; DESCRIPTION: Renders a orange line between points (169, 196) and (347, 21).
; PLAN: r0=169(x1), r1=196(y1), r2=347(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 196
LDI r2, 347
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
