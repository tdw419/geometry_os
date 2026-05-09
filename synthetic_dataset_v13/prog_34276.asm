; DESCRIPTION: Draws a white line from (188, 55) to (451, 100).
; PLAN: r0=188(x1), r1=55(y1), r2=451(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 55
LDI r2, 451
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
