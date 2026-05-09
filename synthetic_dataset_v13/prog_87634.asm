; DESCRIPTION: Places a red line segment connecting (37, 72) to (283, 188).
; PLAN: r0=37(x1), r1=72(y1), r2=283(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 72
LDI r2, 283
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
