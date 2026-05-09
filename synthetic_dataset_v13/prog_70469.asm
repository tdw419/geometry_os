; DESCRIPTION: Places a blue line segment connecting (53, 239) to (430, 137).
; PLAN: r0=53(x1), r1=239(y1), r2=430(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 239
LDI r2, 430
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
