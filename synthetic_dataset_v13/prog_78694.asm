; DESCRIPTION: Places a green circle of radius 44 at center (223, 112).
; PLAN: r0=223(x), r1=112(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 112
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
