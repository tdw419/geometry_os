; DESCRIPTION: Draws a black line from (436, 41) to (191, 123).
; PLAN: r0=436(x1), r1=41(y1), r2=191(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 41
LDI r2, 191
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
