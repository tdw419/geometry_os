; DESCRIPTION: Renders a orange line between points (347, 218) and (239, 52).
; PLAN: r0=347(x1), r1=218(y1), r2=239(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 218
LDI r2, 239
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
