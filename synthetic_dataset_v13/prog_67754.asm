; DESCRIPTION: Draws a white line from (99, 116) to (430, 121).
; PLAN: r0=99(x1), r1=116(y1), r2=430(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 116
LDI r2, 430
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
