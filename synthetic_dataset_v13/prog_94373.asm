; DESCRIPTION: Draws a black line from (377, 224) to (41, 161).
; PLAN: r0=377(x1), r1=224(y1), r2=41(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 224
LDI r2, 41
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
