; DESCRIPTION: Places a red line segment connecting (419, 39) to (175, 88).
; PLAN: r0=419(x1), r1=39(y1), r2=175(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 39
LDI r2, 175
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
