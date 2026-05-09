; DESCRIPTION: Places a black line segment connecting (221, 137) to (470, 8).
; PLAN: r0=221(x1), r1=137(y1), r2=470(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 137
LDI r2, 470
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
