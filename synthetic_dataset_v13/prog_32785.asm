; DESCRIPTION: Creates a green circular shape at (287, 93) with radius 58.
; PLAN: r0=287(x), r1=93(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 93
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
