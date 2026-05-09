; DESCRIPTION: Draws a white line from (493, 95) to (203, 204).
; PLAN: r0=493(x1), r1=95(y1), r2=203(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 95
LDI r2, 203
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
