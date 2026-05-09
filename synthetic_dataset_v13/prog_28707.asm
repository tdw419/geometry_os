; DESCRIPTION: Draws a orange line from (457, 53) to (27, 169).
; PLAN: r0=457(x1), r1=53(y1), r2=27(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 53
LDI r2, 27
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
