; DESCRIPTION: Places a blue line segment connecting (481, 48) to (433, 69).
; PLAN: r0=481(x1), r1=48(y1), r2=433(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 48
LDI r2, 433
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
