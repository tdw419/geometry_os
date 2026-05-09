; DESCRIPTION: Renders a orange line between points (186, 0) and (347, 176).
; PLAN: r0=186(x1), r1=0(y1), r2=347(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 0
LDI r2, 347
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
