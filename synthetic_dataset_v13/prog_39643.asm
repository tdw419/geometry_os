; DESCRIPTION: Places a black line segment connecting (339, 37) to (79, 176).
; PLAN: r0=339(x1), r1=37(y1), r2=79(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 37
LDI r2, 79
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
