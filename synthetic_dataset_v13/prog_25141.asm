; DESCRIPTION: Renders a orange line between points (254, 80) and (161, 134).
; PLAN: r0=254(x1), r1=80(y1), r2=161(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 80
LDI r2, 161
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
