; DESCRIPTION: Draws a green line from (125, 10) to (41, 77).
; PLAN: r0=125(x1), r1=10(y1), r2=41(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 10
LDI r2, 41
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
