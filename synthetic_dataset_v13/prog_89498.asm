; DESCRIPTION: Places a black line segment connecting (254, 89) to (18, 111).
; PLAN: r0=254(x1), r1=89(y1), r2=18(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 89
LDI r2, 18
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
