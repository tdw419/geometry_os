; DESCRIPTION: Places a red line segment connecting (373, 47) to (90, 162).
; PLAN: r0=373(x1), r1=47(y1), r2=90(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 47
LDI r2, 90
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
