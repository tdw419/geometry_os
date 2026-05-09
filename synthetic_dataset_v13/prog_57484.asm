; DESCRIPTION: Places a red line segment connecting (54, 21) to (116, 22).
; PLAN: r0=54(x1), r1=21(y1), r2=116(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 21
LDI r2, 116
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
