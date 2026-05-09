; DESCRIPTION: Draws a green line from (316, 33) to (189, 186).
; PLAN: r0=316(x1), r1=33(y1), r2=189(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 33
LDI r2, 189
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
