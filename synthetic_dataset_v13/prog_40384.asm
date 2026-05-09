; DESCRIPTION: Draws a white line from (103, 227) to (41, 21).
; PLAN: r0=103(x1), r1=227(y1), r2=41(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 227
LDI r2, 41
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
