; DESCRIPTION: Draws a white line from (334, 41) to (345, 175).
; PLAN: r0=334(x1), r1=41(y1), r2=345(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 41
LDI r2, 345
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
