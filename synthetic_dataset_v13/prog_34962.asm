; DESCRIPTION: Places a black line segment connecting (475, 193) to (221, 22).
; PLAN: r0=475(x1), r1=193(y1), r2=221(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 193
LDI r2, 221
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
