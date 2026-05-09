; DESCRIPTION: Draws a red line from (444, 184) to (222, 155).
; PLAN: r0=444(x1), r1=184(y1), r2=222(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 184
LDI r2, 222
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
