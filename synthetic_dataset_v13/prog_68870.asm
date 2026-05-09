; DESCRIPTION: Places a red line segment connecting (473, 74) to (162, 39).
; PLAN: r0=473(x1), r1=74(y1), r2=162(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 74
LDI r2, 162
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
