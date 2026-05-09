; DESCRIPTION: Draws a blue line from (167, 105) to (316, 59).
; PLAN: r0=167(x1), r1=105(y1), r2=316(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 105
LDI r2, 316
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
