; DESCRIPTION: Places a white line segment connecting (316, 65) to (99, 240).
; PLAN: r0=316(x1), r1=65(y1), r2=99(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 65
LDI r2, 99
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
