; DESCRIPTION: Places a black line segment connecting (174, 137) to (291, 31).
; PLAN: r0=174(x1), r1=137(y1), r2=291(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 137
LDI r2, 291
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
