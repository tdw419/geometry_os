; DESCRIPTION: Places a orange line segment connecting (473, 121) to (449, 82).
; PLAN: r0=473(x1), r1=121(y1), r2=449(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 121
LDI r2, 449
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
