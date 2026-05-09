; DESCRIPTION: Draws a white line from (452, 134) to (120, 194).
; PLAN: r0=452(x1), r1=134(y1), r2=120(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 134
LDI r2, 120
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
