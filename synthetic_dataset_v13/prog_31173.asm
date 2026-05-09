; DESCRIPTION: Draws a black line from (357, 83) to (41, 27).
; PLAN: r0=357(x1), r1=83(y1), r2=41(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 83
LDI r2, 41
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
