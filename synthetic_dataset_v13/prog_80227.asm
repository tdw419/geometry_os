; DESCRIPTION: Draws a magenta line from (269, 133) to (318, 41).
; PLAN: r0=269(x1), r1=133(y1), r2=318(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 133
LDI r2, 318
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
