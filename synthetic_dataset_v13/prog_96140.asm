; DESCRIPTION: Draws a orange line from (346, 4) to (497, 177).
; PLAN: r0=346(x1), r1=4(y1), r2=497(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 4
LDI r2, 497
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
