; DESCRIPTION: Places a green line segment connecting (286, 17) to (327, 232).
; PLAN: r0=286(x1), r1=17(y1), r2=327(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 17
LDI r2, 327
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
