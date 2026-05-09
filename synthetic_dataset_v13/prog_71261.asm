; DESCRIPTION: Renders a orange line between points (353, 244) and (218, 160).
; PLAN: r0=353(x1), r1=244(y1), r2=218(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 244
LDI r2, 218
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
