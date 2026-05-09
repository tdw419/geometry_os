; DESCRIPTION: Places a black line segment connecting (287, 193) to (202, 26).
; PLAN: r0=287(x1), r1=193(y1), r2=202(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 193
LDI r2, 202
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
