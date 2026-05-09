; DESCRIPTION: Places a red line segment connecting (1, 93) to (501, 33).
; PLAN: r0=1(x1), r1=93(y1), r2=501(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 93
LDI r2, 501
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
