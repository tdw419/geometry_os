; DESCRIPTION: Places a red line segment connecting (353, 90) to (25, 84).
; PLAN: r0=353(x1), r1=90(y1), r2=25(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 90
LDI r2, 25
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
