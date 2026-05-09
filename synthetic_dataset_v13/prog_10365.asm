; DESCRIPTION: Draws a white line from (273, 178) to (343, 203).
; PLAN: r0=273(x1), r1=178(y1), r2=343(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 178
LDI r2, 343
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
