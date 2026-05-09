; DESCRIPTION: Places a yellow line segment connecting (316, 147) to (469, 177).
; PLAN: r0=316(x1), r1=147(y1), r2=469(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 147
LDI r2, 469
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
