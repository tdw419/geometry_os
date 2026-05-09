; DESCRIPTION: Draws a white line from (203, 185) to (509, 18).
; PLAN: r0=203(x1), r1=185(y1), r2=509(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 185
LDI r2, 509
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
