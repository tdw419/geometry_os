; DESCRIPTION: Places a green line segment connecting (361, 230) to (316, 60).
; PLAN: r0=361(x1), r1=230(y1), r2=316(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 230
LDI r2, 316
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
