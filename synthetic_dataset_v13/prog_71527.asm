; DESCRIPTION: Draws a white line from (116, 122) to (357, 7).
; PLAN: r0=116(x1), r1=122(y1), r2=357(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 122
LDI r2, 357
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
