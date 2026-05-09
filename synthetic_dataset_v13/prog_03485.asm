; DESCRIPTION: Places a black line segment connecting (315, 130) to (490, 43).
; PLAN: r0=315(x1), r1=130(y1), r2=490(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 130
LDI r2, 490
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
