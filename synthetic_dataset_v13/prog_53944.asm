; DESCRIPTION: Renders a black line between points (19, 172) and (490, 151).
; PLAN: r0=19(x1), r1=172(y1), r2=490(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 172
LDI r2, 490
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
