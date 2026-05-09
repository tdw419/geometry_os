; DESCRIPTION: Draws a white line from (429, 61) to (163, 58).
; PLAN: r0=429(x1), r1=61(y1), r2=163(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 61
LDI r2, 163
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
