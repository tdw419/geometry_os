; DESCRIPTION: Draws a orange line from (368, 252) to (465, 130).
; PLAN: r0=368(x1), r1=252(y1), r2=465(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 252
LDI r2, 465
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
