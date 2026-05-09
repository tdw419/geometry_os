; DESCRIPTION: Draws a black line from (42, 78) to (497, 74).
; PLAN: r0=42(x1), r1=78(y1), r2=497(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 78
LDI r2, 497
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
