; DESCRIPTION: Creates a yellow circular shape at (223, 187) with radius 59.
; PLAN: r0=223(x), r1=187(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 187
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
