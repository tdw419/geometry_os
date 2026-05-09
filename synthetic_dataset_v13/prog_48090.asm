; DESCRIPTION: Places a black line segment connecting (87, 49) to (374, 24).
; PLAN: r0=87(x1), r1=49(y1), r2=374(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 49
LDI r2, 374
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
