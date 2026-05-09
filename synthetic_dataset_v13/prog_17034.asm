; DESCRIPTION: Draws a orange line from (241, 187) to (139, 169).
; PLAN: r0=241(x1), r1=187(y1), r2=139(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 187
LDI r2, 139
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
