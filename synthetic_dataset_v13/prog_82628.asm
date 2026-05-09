; DESCRIPTION: Draws a black line from (50, 77) to (41, 76).
; PLAN: r0=50(x1), r1=77(y1), r2=41(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 77
LDI r2, 41
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
