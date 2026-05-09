; DESCRIPTION: Draws a orange line from (405, 109) to (147, 195).
; PLAN: r0=405(x1), r1=109(y1), r2=147(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 109
LDI r2, 147
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
