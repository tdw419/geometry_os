; DESCRIPTION: Places a green line segment connecting (412, 222) to (326, 88).
; PLAN: r0=412(x1), r1=222(y1), r2=326(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 222
LDI r2, 326
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
