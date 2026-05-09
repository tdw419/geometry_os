; DESCRIPTION: Draws a red line from (497, 25) to (492, 120).
; PLAN: r0=497(x1), r1=25(y1), r2=492(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 25
LDI r2, 492
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
