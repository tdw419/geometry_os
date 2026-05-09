; DESCRIPTION: Draws a black line from (124, 94) to (85, 41).
; PLAN: r0=124(x1), r1=94(y1), r2=85(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 94
LDI r2, 85
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
