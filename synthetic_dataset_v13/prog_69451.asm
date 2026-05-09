; DESCRIPTION: Places a blue line segment connecting (51, 67) to (21, 64).
; PLAN: r0=51(x1), r1=67(y1), r2=21(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 67
LDI r2, 21
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
