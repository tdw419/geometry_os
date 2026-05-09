; DESCRIPTION: Places a yellow line segment connecting (263, 155) to (289, 138).
; PLAN: r0=263(x1), r1=155(y1), r2=289(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 155
LDI r2, 289
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
