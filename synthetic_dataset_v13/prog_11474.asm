; DESCRIPTION: Places a red line segment connecting (205, 110) to (90, 48).
; PLAN: r0=205(x1), r1=110(y1), r2=90(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 110
LDI r2, 90
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
