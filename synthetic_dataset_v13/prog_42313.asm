; DESCRIPTION: Draws a white line from (232, 194) to (150, 120).
; PLAN: r0=232(x1), r1=194(y1), r2=150(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 194
LDI r2, 150
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
