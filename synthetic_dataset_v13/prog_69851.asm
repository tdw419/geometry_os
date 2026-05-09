; DESCRIPTION: Places a black line segment connecting (65, 198) to (76, 33).
; PLAN: r0=65(x1), r1=198(y1), r2=76(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 198
LDI r2, 76
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
