; DESCRIPTION: Draws a white line from (377, 60) to (363, 0).
; PLAN: r0=377(x1), r1=60(y1), r2=363(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 60
LDI r2, 363
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
