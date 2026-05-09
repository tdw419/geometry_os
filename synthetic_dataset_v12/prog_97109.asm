; DESCRIPTION: Places a green line segment connecting (62, 39) to (316, 9).
; PLAN: r0=62(x1), r1=39(y1), r2=316(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 39
LDI r2, 316
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
