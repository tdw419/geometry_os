; DESCRIPTION: Draws a black line from (427, 187) to (499, 245).
; PLAN: r0=427(x1), r1=187(y1), r2=499(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 187
LDI r2, 499
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
