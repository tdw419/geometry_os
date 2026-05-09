; DESCRIPTION: Places a blue line segment connecting (88, 239) to (329, 22).
; PLAN: r0=88(x1), r1=239(y1), r2=329(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 239
LDI r2, 329
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
