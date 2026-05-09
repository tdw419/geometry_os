; DESCRIPTION: Places a green line segment connecting (136, 80) to (283, 138).
; PLAN: r0=136(x1), r1=80(y1), r2=283(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 80
LDI r2, 283
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
