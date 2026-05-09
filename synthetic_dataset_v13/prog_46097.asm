; DESCRIPTION: Places a yellow circle of radius 40 at center (112, 47).
; PLAN: r0=112(x), r1=47(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 47
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
