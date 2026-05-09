; DESCRIPTION: Places a red line segment connecting (367, 89) to (473, 189).
; PLAN: r0=367(x1), r1=89(y1), r2=473(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 89
LDI r2, 473
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
