; DESCRIPTION: Draws a yellow line from (316, 100) to (82, 25).
; PLAN: r0=316(x1), r1=100(y1), r2=82(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 100
LDI r2, 82
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
