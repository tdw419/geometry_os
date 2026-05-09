; DESCRIPTION: Draws a black line from (377, 41) to (169, 192).
; PLAN: r0=377(x1), r1=41(y1), r2=169(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 41
LDI r2, 169
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
