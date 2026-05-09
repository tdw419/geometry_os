; DESCRIPTION: Draws a black line from (316, 174) to (284, 87).
; PLAN: r0=316(x1), r1=174(y1), r2=284(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 174
LDI r2, 284
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
