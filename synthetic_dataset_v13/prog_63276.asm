; DESCRIPTION: Places a red line segment connecting (7, 148) to (459, 220).
; PLAN: r0=7(x1), r1=148(y1), r2=459(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 148
LDI r2, 459
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
