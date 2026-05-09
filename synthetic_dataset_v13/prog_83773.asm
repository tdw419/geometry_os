; DESCRIPTION: Draws a black line from (348, 150) to (497, 19).
; PLAN: r0=348(x1), r1=150(y1), r2=497(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 150
LDI r2, 497
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
