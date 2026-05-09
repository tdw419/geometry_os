; DESCRIPTION: Draws a red line from (33, 32) to (497, 137).
; PLAN: r0=33(x1), r1=32(y1), r2=497(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 32
LDI r2, 497
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
