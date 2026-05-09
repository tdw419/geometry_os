; DESCRIPTION: Renders a orange line between points (283, 164) and (17, 168).
; PLAN: r0=283(x1), r1=164(y1), r2=17(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 164
LDI r2, 17
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
