; DESCRIPTION: Draws a red line from (334, 102) to (129, 203).
; PLAN: r0=334(x1), r1=102(y1), r2=129(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 102
LDI r2, 129
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
