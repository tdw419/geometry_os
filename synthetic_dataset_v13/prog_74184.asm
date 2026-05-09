; DESCRIPTION: Draws a yellow line from (497, 52) to (430, 31).
; PLAN: r0=497(x1), r1=52(y1), r2=430(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 52
LDI r2, 430
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
