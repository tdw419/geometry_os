; DESCRIPTION: Places a black line segment connecting (57, 107) to (244, 74).
; PLAN: r0=57(x1), r1=107(y1), r2=244(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 107
LDI r2, 244
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
