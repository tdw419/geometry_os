; DESCRIPTION: Places a red line segment connecting (386, 114) to (316, 175).
; PLAN: r0=386(x1), r1=114(y1), r2=316(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 114
LDI r2, 316
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
