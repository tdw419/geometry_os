; DESCRIPTION: Renders a orange line between points (25, 231) and (234, 136).
; PLAN: r0=25(x1), r1=231(y1), r2=234(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 231
LDI r2, 234
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
