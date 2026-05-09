; DESCRIPTION: Places a yellow line segment connecting (333, 88) to (409, 28).
; PLAN: r0=333(x1), r1=88(y1), r2=409(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 88
LDI r2, 409
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
