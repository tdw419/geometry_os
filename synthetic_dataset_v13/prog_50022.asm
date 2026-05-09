; DESCRIPTION: Renders a orange line between points (234, 141) and (52, 14).
; PLAN: r0=234(x1), r1=141(y1), r2=52(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 141
LDI r2, 52
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
