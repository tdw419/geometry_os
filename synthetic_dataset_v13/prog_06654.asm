; DESCRIPTION: Renders a orange line between points (133, 161) and (265, 198).
; PLAN: r0=133(x1), r1=161(y1), r2=265(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 161
LDI r2, 265
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
