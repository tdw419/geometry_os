; DESCRIPTION: Places a red line segment connecting (316, 69) to (462, 219).
; PLAN: r0=316(x1), r1=69(y1), r2=462(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 69
LDI r2, 462
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
