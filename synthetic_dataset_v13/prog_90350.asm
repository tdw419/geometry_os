; DESCRIPTION: Places a purple line segment connecting (455, 141) to (392, 151).
; PLAN: r0=455(x1), r1=141(y1), r2=392(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 141
LDI r2, 392
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
