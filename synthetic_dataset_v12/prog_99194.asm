; DESCRIPTION: Places a magenta line segment connecting (395, 251) to (485, 151).
; PLAN: r0=395(x1), r1=251(y1), r2=485(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 251
LDI r2, 485
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
