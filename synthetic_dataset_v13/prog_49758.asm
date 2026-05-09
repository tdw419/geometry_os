; DESCRIPTION: Draws a orange line from (312, 71) to (176, 223).
; PLAN: r0=312(x1), r1=71(y1), r2=176(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 71
LDI r2, 176
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
