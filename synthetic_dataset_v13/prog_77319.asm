; DESCRIPTION: Places a yellow line segment connecting (317, 167) to (13, 254).
; PLAN: r0=317(x1), r1=167(y1), r2=13(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 167
LDI r2, 13
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
