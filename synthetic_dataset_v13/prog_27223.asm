; DESCRIPTION: Renders a orange line between points (222, 143) and (395, 244).
; PLAN: r0=222(x1), r1=143(y1), r2=395(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 143
LDI r2, 395
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
