; DESCRIPTION: Places a red line segment connecting (64, 94) to (473, 72).
; PLAN: r0=64(x1), r1=94(y1), r2=473(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 94
LDI r2, 473
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
