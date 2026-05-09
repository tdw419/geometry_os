; DESCRIPTION: Places a red line segment connecting (245, 8) to (395, 67).
; PLAN: r0=245(x1), r1=8(y1), r2=395(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 8
LDI r2, 395
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
