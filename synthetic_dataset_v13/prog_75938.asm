; DESCRIPTION: Places a blue line segment connecting (494, 96) to (190, 123).
; PLAN: r0=494(x1), r1=96(y1), r2=190(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 96
LDI r2, 190
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
