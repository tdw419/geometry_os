; DESCRIPTION: Draws a red line from (244, 55) to (451, 2).
; PLAN: r0=244(x1), r1=55(y1), r2=451(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 55
LDI r2, 451
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
