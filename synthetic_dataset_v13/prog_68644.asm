; DESCRIPTION: Draws a black line from (73, 122) to (425, 245).
; PLAN: r0=73(x1), r1=122(y1), r2=425(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 122
LDI r2, 425
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
