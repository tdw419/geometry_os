; DESCRIPTION: Places a green line segment connecting (58, 17) to (319, 136).
; PLAN: r0=58(x1), r1=17(y1), r2=319(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 17
LDI r2, 319
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
