; DESCRIPTION: Places a blue line segment connecting (32, 114) to (64, 2).
; PLAN: r0=32(x1), r1=114(y1), r2=64(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 114
LDI r2, 64
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
