; DESCRIPTION: Places a black line segment connecting (323, 128) to (501, 142).
; PLAN: r0=323(x1), r1=128(y1), r2=501(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 128
LDI r2, 501
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
