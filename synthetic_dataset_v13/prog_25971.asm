; DESCRIPTION: Renders a orange line between points (219, 162) and (438, 161).
; PLAN: r0=219(x1), r1=162(y1), r2=438(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 162
LDI r2, 438
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
