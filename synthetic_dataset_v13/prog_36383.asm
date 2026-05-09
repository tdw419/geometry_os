; DESCRIPTION: Places a green line segment connecting (126, 49) to (194, 140).
; PLAN: r0=126(x1), r1=49(y1), r2=194(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 49
LDI r2, 194
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
