; DESCRIPTION: Draws a black line from (454, 41) to (114, 24).
; PLAN: r0=454(x1), r1=41(y1), r2=114(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 41
LDI r2, 114
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
