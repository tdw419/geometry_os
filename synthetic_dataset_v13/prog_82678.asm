; DESCRIPTION: Places a green line segment connecting (263, 216) to (318, 90).
; PLAN: r0=263(x1), r1=216(y1), r2=318(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 216
LDI r2, 318
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
