; DESCRIPTION: Renders a orange line between points (347, 184) and (415, 118).
; PLAN: r0=347(x1), r1=184(y1), r2=415(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 184
LDI r2, 415
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
