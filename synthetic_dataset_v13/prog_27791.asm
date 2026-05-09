; DESCRIPTION: Places a green line segment connecting (316, 172) to (328, 175).
; PLAN: r0=316(x1), r1=172(y1), r2=328(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 172
LDI r2, 328
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
