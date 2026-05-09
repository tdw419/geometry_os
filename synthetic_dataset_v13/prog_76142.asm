; DESCRIPTION: Draws a white line from (452, 214) to (334, 203).
; PLAN: r0=452(x1), r1=214(y1), r2=334(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 214
LDI r2, 334
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
