; DESCRIPTION: Places a yellow line segment connecting (310, 223) to (223, 99).
; PLAN: r0=310(x1), r1=223(y1), r2=223(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 223
LDI r2, 223
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
