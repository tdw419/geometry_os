; DESCRIPTION: Places a blue line segment connecting (0, 64) to (100, 81).
; PLAN: r0=0(x1), r1=64(y1), r2=100(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 64
LDI r2, 100
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
