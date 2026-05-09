; DESCRIPTION: Draws a black line from (361, 64) to (423, 41).
; PLAN: r0=361(x1), r1=64(y1), r2=423(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 64
LDI r2, 423
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
