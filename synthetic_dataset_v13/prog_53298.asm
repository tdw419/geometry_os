; DESCRIPTION: Draws a black line from (497, 73) to (473, 61).
; PLAN: r0=497(x1), r1=73(y1), r2=473(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 73
LDI r2, 473
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
