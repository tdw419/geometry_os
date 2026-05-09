; DESCRIPTION: Places a red line segment connecting (496, 28) to (288, 70).
; PLAN: r0=496(x1), r1=28(y1), r2=288(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 28
LDI r2, 288
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
