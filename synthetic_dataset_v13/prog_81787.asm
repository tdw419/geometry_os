; DESCRIPTION: Draws a orange line from (418, 137) to (93, 182).
; PLAN: r0=418(x1), r1=137(y1), r2=93(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 137
LDI r2, 93
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
