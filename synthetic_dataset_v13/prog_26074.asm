; DESCRIPTION: Places a black line segment connecting (223, 46) to (129, 156).
; PLAN: r0=223(x1), r1=46(y1), r2=129(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 46
LDI r2, 129
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
