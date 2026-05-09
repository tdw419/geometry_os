; DESCRIPTION: Places a black line segment connecting (74, 86) to (151, 189).
; PLAN: r0=74(x1), r1=86(y1), r2=151(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 86
LDI r2, 151
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
