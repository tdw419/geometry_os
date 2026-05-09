; DESCRIPTION: Places a green line segment connecting (279, 237) to (472, 17).
; PLAN: r0=279(x1), r1=237(y1), r2=472(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 237
LDI r2, 472
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
