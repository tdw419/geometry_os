; DESCRIPTION: Places a blue line segment connecting (374, 67) to (45, 1).
; PLAN: r0=374(x1), r1=67(y1), r2=45(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 67
LDI r2, 45
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
