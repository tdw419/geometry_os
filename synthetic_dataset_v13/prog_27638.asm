; DESCRIPTION: Places a black line segment connecting (442, 114) to (371, 251).
; PLAN: r0=442(x1), r1=114(y1), r2=371(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 114
LDI r2, 371
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
