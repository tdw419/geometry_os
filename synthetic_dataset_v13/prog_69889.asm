; DESCRIPTION: Places a green line segment connecting (347, 199) to (426, 25).
; PLAN: r0=347(x1), r1=199(y1), r2=426(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 199
LDI r2, 426
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
