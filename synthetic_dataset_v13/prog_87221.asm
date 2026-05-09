; DESCRIPTION: Renders a orange line between points (189, 234) and (60, 227).
; PLAN: r0=189(x1), r1=234(y1), r2=60(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 234
LDI r2, 60
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
