; DESCRIPTION: Places a green line segment connecting (99, 121) to (316, 175).
; PLAN: r0=99(x1), r1=121(y1), r2=316(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 121
LDI r2, 316
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
