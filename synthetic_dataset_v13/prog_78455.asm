; DESCRIPTION: Places a black line segment connecting (143, 83) to (208, 176).
; PLAN: r0=143(x1), r1=83(y1), r2=208(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 83
LDI r2, 208
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
