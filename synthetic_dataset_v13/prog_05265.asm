; DESCRIPTION: Draws a green line from (316, 13) to (385, 206).
; PLAN: r0=316(x1), r1=13(y1), r2=385(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 13
LDI r2, 385
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
