; DESCRIPTION: Draws a black line from (266, 11) to (405, 41).
; PLAN: r0=266(x1), r1=11(y1), r2=405(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 11
LDI r2, 405
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
