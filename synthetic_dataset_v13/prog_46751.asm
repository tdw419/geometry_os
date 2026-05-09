; DESCRIPTION: Places a blue line segment connecting (190, 22) to (239, 196).
; PLAN: r0=190(x1), r1=22(y1), r2=239(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 22
LDI r2, 239
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
