; DESCRIPTION: Draws a black line from (497, 93) to (268, 114).
; PLAN: r0=497(x1), r1=93(y1), r2=268(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 93
LDI r2, 268
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
