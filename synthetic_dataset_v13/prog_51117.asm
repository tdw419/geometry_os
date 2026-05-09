; DESCRIPTION: Places a yellow line segment connecting (229, 140) to (455, 176).
; PLAN: r0=229(x1), r1=140(y1), r2=455(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 140
LDI r2, 455
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
