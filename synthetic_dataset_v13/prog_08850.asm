; DESCRIPTION: Draws a blue line from (316, 17) to (370, 103).
; PLAN: r0=316(x1), r1=17(y1), r2=370(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 17
LDI r2, 370
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
