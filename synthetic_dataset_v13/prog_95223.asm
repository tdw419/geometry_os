; DESCRIPTION: Draws a yellow line from (316, 224) to (76, 249).
; PLAN: r0=316(x1), r1=224(y1), r2=76(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 224
LDI r2, 76
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
