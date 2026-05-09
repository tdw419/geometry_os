; DESCRIPTION: Draws a white line from (206, 41) to (134, 97).
; PLAN: r0=206(x1), r1=41(y1), r2=134(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 41
LDI r2, 134
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
