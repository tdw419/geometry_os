; DESCRIPTION: Places a blue line segment connecting (56, 176) to (455, 167).
; PLAN: r0=56(x1), r1=176(y1), r2=455(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 176
LDI r2, 455
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
