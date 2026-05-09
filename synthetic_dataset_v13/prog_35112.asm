; DESCRIPTION: Places a black line segment connecting (330, 31) to (359, 153).
; PLAN: r0=330(x1), r1=31(y1), r2=359(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 31
LDI r2, 359
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
