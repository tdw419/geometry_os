; DESCRIPTION: Places a red line segment connecting (69, 110) to (373, 226).
; PLAN: r0=69(x1), r1=110(y1), r2=373(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 110
LDI r2, 373
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
