; DESCRIPTION: Draws a black line from (156, 198) to (366, 41).
; PLAN: r0=156(x1), r1=198(y1), r2=366(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 198
LDI r2, 366
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
