; DESCRIPTION: Draws a red line from (469, 18) to (501, 53).
; PLAN: r0=469(x1), r1=18(y1), r2=501(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 18
LDI r2, 501
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
