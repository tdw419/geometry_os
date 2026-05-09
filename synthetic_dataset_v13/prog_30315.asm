; DESCRIPTION: Places a red line segment connecting (59, 224) to (43, 77).
; PLAN: r0=59(x1), r1=224(y1), r2=43(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 224
LDI r2, 43
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
