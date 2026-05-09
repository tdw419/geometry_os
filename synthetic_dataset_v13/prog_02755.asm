; DESCRIPTION: Draws a black line from (159, 187) to (95, 122).
; PLAN: r0=159(x1), r1=187(y1), r2=95(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 187
LDI r2, 95
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
