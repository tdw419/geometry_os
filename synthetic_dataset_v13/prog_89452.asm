; DESCRIPTION: Draws a white line from (203, 216) to (164, 26).
; PLAN: r0=203(x1), r1=216(y1), r2=164(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 216
LDI r2, 164
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
