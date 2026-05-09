; DESCRIPTION: Places a black line segment connecting (269, 233) to (2, 176).
; PLAN: r0=269(x1), r1=233(y1), r2=2(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 233
LDI r2, 2
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
