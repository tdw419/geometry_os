; DESCRIPTION: Draws a green line from (271, 3) to (316, 71).
; PLAN: r0=271(x1), r1=3(y1), r2=316(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 3
LDI r2, 316
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
