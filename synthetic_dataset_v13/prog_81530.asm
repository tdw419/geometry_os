; DESCRIPTION: Places a black line segment connecting (271, 88) to (240, 100).
; PLAN: r0=271(x1), r1=88(y1), r2=240(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 88
LDI r2, 240
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
