; DESCRIPTION: Places a purple line segment connecting (1, 43) to (479, 88).
; PLAN: r0=1(x1), r1=43(y1), r2=479(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 43
LDI r2, 479
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
