; DESCRIPTION: Renders a orange line between points (161, 161) and (266, 173).
; PLAN: r0=161(x1), r1=161(y1), r2=266(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 161
LDI r2, 266
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
