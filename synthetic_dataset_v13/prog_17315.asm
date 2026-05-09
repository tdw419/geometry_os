; DESCRIPTION: Places a blue line segment connecting (333, 32) to (153, 77).
; PLAN: r0=333(x1), r1=32(y1), r2=153(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 32
LDI r2, 153
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
