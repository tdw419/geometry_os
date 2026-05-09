; DESCRIPTION: Places a black line segment connecting (211, 216) to (433, 170).
; PLAN: r0=211(x1), r1=216(y1), r2=433(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 216
LDI r2, 433
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
