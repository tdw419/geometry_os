; DESCRIPTION: Draws a orange line from (203, 233) to (337, 202).
; PLAN: r0=203(x1), r1=233(y1), r2=337(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 233
LDI r2, 337
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
