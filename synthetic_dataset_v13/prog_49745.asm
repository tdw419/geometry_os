; DESCRIPTION: Renders a orange line between points (296, 223) and (347, 7).
; PLAN: r0=296(x1), r1=223(y1), r2=347(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 223
LDI r2, 347
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
