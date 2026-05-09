; DESCRIPTION: Places a green circle of radius 53 at center (264, 138).
; PLAN: r0=264(x), r1=138(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 138
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
