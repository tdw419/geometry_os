; DESCRIPTION: Places a blue line segment connecting (333, 44) to (64, 10).
; PLAN: r0=333(x1), r1=44(y1), r2=64(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 44
LDI r2, 64
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
