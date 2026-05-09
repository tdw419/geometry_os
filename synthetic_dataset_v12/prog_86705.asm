; DESCRIPTION: Places a black line segment connecting (442, 37) to (83, 231).
; PLAN: r0=442(x1), r1=37(y1), r2=83(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 37
LDI r2, 83
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
