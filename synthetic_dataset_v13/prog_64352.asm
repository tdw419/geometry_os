; DESCRIPTION: Draws a black line from (362, 88) to (316, 9).
; PLAN: r0=362(x1), r1=88(y1), r2=316(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 88
LDI r2, 316
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
