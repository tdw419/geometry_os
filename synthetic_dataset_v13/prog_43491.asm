; DESCRIPTION: Draws a black line from (466, 125) to (89, 53).
; PLAN: r0=466(x1), r1=125(y1), r2=89(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 125
LDI r2, 89
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
