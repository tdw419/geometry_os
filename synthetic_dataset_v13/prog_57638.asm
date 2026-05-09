; DESCRIPTION: Draws a white line from (233, 41) to (32, 217).
; PLAN: r0=233(x1), r1=41(y1), r2=32(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 41
LDI r2, 32
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
