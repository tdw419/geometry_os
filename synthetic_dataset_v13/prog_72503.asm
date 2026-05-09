; DESCRIPTION: Places a blue line segment connecting (210, 128) to (43, 69).
; PLAN: r0=210(x1), r1=128(y1), r2=43(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 128
LDI r2, 43
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
