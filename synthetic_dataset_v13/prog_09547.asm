; DESCRIPTION: Places a yellow circle of radius 43 at center (274, 187).
; PLAN: r0=274(x), r1=187(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 187
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
