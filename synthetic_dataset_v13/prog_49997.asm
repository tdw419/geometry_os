; DESCRIPTION: Places a blue line segment connecting (76, 32) to (384, 39).
; PLAN: r0=76(x1), r1=32(y1), r2=384(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 32
LDI r2, 384
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
