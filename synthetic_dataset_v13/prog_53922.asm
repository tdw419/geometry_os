; DESCRIPTION: Renders a orange line between points (34, 239) and (414, 137).
; PLAN: r0=34(x1), r1=239(y1), r2=414(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 239
LDI r2, 414
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
