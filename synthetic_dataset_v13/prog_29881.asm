; DESCRIPTION: Draws a blue line from (494, 41) to (251, 53).
; PLAN: r0=494(x1), r1=41(y1), r2=251(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 41
LDI r2, 251
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
