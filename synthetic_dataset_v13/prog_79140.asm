; DESCRIPTION: Places a red line segment connecting (374, 23) to (83, 203).
; PLAN: r0=374(x1), r1=23(y1), r2=83(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 23
LDI r2, 83
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
