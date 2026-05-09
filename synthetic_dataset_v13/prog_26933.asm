; DESCRIPTION: Draws a orange line from (411, 169) to (34, 42).
; PLAN: r0=411(x1), r1=169(y1), r2=34(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 169
LDI r2, 34
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
