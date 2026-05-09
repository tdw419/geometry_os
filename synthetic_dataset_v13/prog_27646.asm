; DESCRIPTION: Draws a white line from (53, 95) to (497, 60).
; PLAN: r0=53(x1), r1=95(y1), r2=497(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 95
LDI r2, 497
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
