; DESCRIPTION: Renders a orange line between points (134, 198) and (135, 222).
; PLAN: r0=134(x1), r1=198(y1), r2=135(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 198
LDI r2, 135
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
