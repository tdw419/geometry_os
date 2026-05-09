; DESCRIPTION: Draws a white line from (116, 170) to (51, 244).
; PLAN: r0=116(x1), r1=170(y1), r2=51(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 170
LDI r2, 51
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
