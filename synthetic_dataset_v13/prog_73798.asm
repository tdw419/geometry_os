; DESCRIPTION: Places a blue line segment connecting (167, 191) to (165, 190).
; PLAN: r0=167(x1), r1=191(y1), r2=165(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 191
LDI r2, 165
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
