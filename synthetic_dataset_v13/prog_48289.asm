; DESCRIPTION: Places a black line segment connecting (31, 199) to (108, 150).
; PLAN: r0=31(x1), r1=199(y1), r2=108(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 199
LDI r2, 108
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
