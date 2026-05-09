; DESCRIPTION: Draws a yellow line from (41, 245) to (381, 231).
; PLAN: r0=41(x1), r1=245(y1), r2=381(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 245
LDI r2, 381
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
