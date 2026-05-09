; DESCRIPTION: Draws a orange line from (192, 40) to (266, 167).
; PLAN: r0=192(x1), r1=40(y1), r2=266(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 40
LDI r2, 266
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
