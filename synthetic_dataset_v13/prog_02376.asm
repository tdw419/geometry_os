; DESCRIPTION: Draws a white line from (264, 44) to (118, 41).
; PLAN: r0=264(x1), r1=44(y1), r2=118(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 44
LDI r2, 118
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
