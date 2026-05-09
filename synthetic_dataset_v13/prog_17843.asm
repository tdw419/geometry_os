; DESCRIPTION: Places a blue line segment connecting (244, 222) to (488, 1).
; PLAN: r0=244(x1), r1=222(y1), r2=488(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 222
LDI r2, 488
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
