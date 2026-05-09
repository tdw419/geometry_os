; DESCRIPTION: Places a black line segment connecting (266, 208) to (23, 15).
; PLAN: r0=266(x1), r1=208(y1), r2=23(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 208
LDI r2, 23
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
