; DESCRIPTION: Draws a white line from (190, 253) to (41, 11).
; PLAN: r0=190(x1), r1=253(y1), r2=41(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 253
LDI r2, 41
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
