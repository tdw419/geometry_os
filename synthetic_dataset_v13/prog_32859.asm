; DESCRIPTION: Places a black line segment connecting (356, 4) to (74, 189).
; PLAN: r0=356(x1), r1=4(y1), r2=74(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 4
LDI r2, 74
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
