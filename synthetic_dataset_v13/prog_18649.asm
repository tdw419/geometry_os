; DESCRIPTION: Places a green line segment connecting (355, 127) to (473, 254).
; PLAN: r0=355(x1), r1=127(y1), r2=473(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 127
LDI r2, 473
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
