; DESCRIPTION: Places a blue line segment connecting (488, 85) to (13, 247).
; PLAN: r0=488(x1), r1=85(y1), r2=13(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 85
LDI r2, 13
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
