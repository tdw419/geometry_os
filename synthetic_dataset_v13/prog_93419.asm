; DESCRIPTION: Renders a orange line between points (489, 239) and (287, 233).
; PLAN: r0=489(x1), r1=239(y1), r2=287(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 239
LDI r2, 287
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
