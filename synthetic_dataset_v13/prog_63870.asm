; DESCRIPTION: Renders a orange line between points (38, 155) and (371, 102).
; PLAN: r0=38(x1), r1=155(y1), r2=371(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 155
LDI r2, 371
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
