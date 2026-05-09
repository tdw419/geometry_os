; DESCRIPTION: Draws a blue line from (316, 26) to (460, 54).
; PLAN: r0=316(x1), r1=26(y1), r2=460(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 26
LDI r2, 460
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
