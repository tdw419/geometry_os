; DESCRIPTION: Places a black line segment connecting (364, 5) to (444, 14).
; PLAN: r0=364(x1), r1=5(y1), r2=444(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 5
LDI r2, 444
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
