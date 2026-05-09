; DESCRIPTION: Draws a white line from (203, 22) to (170, 141).
; PLAN: r0=203(x1), r1=22(y1), r2=170(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 22
LDI r2, 170
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
