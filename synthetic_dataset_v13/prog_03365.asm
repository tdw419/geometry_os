; DESCRIPTION: Places a red line segment connecting (360, 189) to (335, 26).
; PLAN: r0=360(x1), r1=189(y1), r2=335(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 189
LDI r2, 335
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
