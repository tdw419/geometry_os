; DESCRIPTION: Places a green line segment connecting (194, 35) to (17, 191).
; PLAN: r0=194(x1), r1=35(y1), r2=17(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 35
LDI r2, 17
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
