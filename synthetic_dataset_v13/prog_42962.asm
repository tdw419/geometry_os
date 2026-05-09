; DESCRIPTION: Places a red line segment connecting (77, 85) to (239, 188).
; PLAN: r0=77(x1), r1=85(y1), r2=239(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 85
LDI r2, 239
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
