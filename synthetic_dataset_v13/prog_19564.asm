; DESCRIPTION: Draws a black line from (212, 53) to (477, 69).
; PLAN: r0=212(x1), r1=53(y1), r2=477(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 53
LDI r2, 477
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
