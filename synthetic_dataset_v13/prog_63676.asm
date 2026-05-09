; DESCRIPTION: Renders a orange line between points (491, 108) and (288, 244).
; PLAN: r0=491(x1), r1=108(y1), r2=288(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 108
LDI r2, 288
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
