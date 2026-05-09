; DESCRIPTION: Places a black line segment connecting (11, 142) to (176, 13).
; PLAN: r0=11(x1), r1=142(y1), r2=176(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 142
LDI r2, 176
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
