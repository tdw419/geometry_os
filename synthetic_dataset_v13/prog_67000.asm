; DESCRIPTION: Draws a yellow line from (427, 245) to (102, 18).
; PLAN: r0=427(x1), r1=245(y1), r2=102(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 245
LDI r2, 102
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
