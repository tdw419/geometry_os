; DESCRIPTION: Places a green line segment connecting (9, 126) to (473, 158).
; PLAN: r0=9(x1), r1=126(y1), r2=473(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 126
LDI r2, 473
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
