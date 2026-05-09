; DESCRIPTION: Places a green line segment connecting (478, 40) to (219, 33).
; PLAN: r0=478(x1), r1=40(y1), r2=219(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 40
LDI r2, 219
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
