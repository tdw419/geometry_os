; DESCRIPTION: Places a red line segment connecting (473, 41) to (463, 65).
; PLAN: r0=473(x1), r1=41(y1), r2=463(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 41
LDI r2, 463
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
