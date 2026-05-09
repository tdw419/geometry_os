; DESCRIPTION: Places a black line segment connecting (313, 28) to (408, 64).
; PLAN: r0=313(x1), r1=28(y1), r2=408(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 28
LDI r2, 408
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
