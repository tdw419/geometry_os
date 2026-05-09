; DESCRIPTION: Places a red line segment connecting (357, 186) to (473, 101).
; PLAN: r0=357(x1), r1=186(y1), r2=473(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 186
LDI r2, 473
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
