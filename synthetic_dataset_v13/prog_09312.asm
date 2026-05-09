; DESCRIPTION: Places a green line segment connecting (26, 75) to (68, 179).
; PLAN: r0=26(x1), r1=75(y1), r2=68(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 75
LDI r2, 68
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
