; DESCRIPTION: Places a purple line segment connecting (239, 140) to (411, 23).
; PLAN: r0=239(x1), r1=140(y1), r2=411(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 140
LDI r2, 411
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
