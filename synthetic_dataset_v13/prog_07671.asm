; DESCRIPTION: Places a yellow line segment connecting (426, 127) to (331, 199).
; PLAN: r0=426(x1), r1=127(y1), r2=331(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 127
LDI r2, 331
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
