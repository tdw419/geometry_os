; DESCRIPTION: Places a red line segment connecting (47, 172) to (495, 19).
; PLAN: r0=47(x1), r1=172(y1), r2=495(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 172
LDI r2, 495
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
