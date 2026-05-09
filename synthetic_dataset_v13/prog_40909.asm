; DESCRIPTION: Places a green line segment connecting (190, 2) to (449, 158).
; PLAN: r0=190(x1), r1=2(y1), r2=449(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 2
LDI r2, 449
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
