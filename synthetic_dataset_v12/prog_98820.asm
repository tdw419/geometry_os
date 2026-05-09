; DESCRIPTION: Draws a blue line from (316, 51) to (18, 59).
; PLAN: r0=316(x1), r1=51(y1), r2=18(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 51
LDI r2, 18
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
