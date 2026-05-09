; DESCRIPTION: Places a black line segment connecting (490, 215) to (151, 11).
; PLAN: r0=490(x1), r1=215(y1), r2=151(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 215
LDI r2, 151
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
