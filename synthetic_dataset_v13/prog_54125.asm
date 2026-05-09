; DESCRIPTION: Places a black line segment connecting (29, 255) to (375, 90).
; PLAN: r0=29(x1), r1=255(y1), r2=375(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 255
LDI r2, 375
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
