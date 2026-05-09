; DESCRIPTION: Places a red line segment connecting (340, 252) to (78, 192).
; PLAN: r0=340(x1), r1=252(y1), r2=78(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 252
LDI r2, 78
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
