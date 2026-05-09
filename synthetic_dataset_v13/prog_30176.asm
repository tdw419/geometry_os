; DESCRIPTION: Draws a white line from (56, 187) to (25, 41).
; PLAN: r0=56(x1), r1=187(y1), r2=25(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 187
LDI r2, 25
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
