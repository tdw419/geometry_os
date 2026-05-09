; DESCRIPTION: Places a green line segment connecting (126, 170) to (71, 133).
; PLAN: r0=126(x1), r1=170(y1), r2=71(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 170
LDI r2, 71
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
