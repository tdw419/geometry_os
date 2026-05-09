; DESCRIPTION: Renders a orange line between points (474, 48) and (429, 17).
; PLAN: r0=474(x1), r1=48(y1), r2=429(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 48
LDI r2, 429
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
