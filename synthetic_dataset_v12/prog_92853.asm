; DESCRIPTION: Draws a white line from (47, 72) to (501, 120).
; PLAN: r0=47(x1), r1=72(y1), r2=501(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 72
LDI r2, 501
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
