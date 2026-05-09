; DESCRIPTION: Places a black line segment connecting (40, 209) to (62, 244).
; PLAN: r0=40(x1), r1=209(y1), r2=62(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 209
LDI r2, 62
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
