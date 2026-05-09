; DESCRIPTION: Draws a orange line from (171, 81) to (341, 12).
; PLAN: r0=171(x1), r1=81(y1), r2=341(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 81
LDI r2, 341
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
