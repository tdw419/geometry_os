; DESCRIPTION: Draws a white line from (477, 40) to (203, 80).
; PLAN: r0=477(x1), r1=40(y1), r2=203(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 40
LDI r2, 203
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
