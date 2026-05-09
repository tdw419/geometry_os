; DESCRIPTION: Places a green line segment connecting (178, 83) to (126, 148).
; PLAN: r0=178(x1), r1=83(y1), r2=126(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 83
LDI r2, 126
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
