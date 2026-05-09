; DESCRIPTION: Places a yellow circle of radius 54 at center (319, 115).
; PLAN: r0=319(x), r1=115(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 115
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
