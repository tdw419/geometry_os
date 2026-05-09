; DESCRIPTION: Creates a yellow circular shape at (308, 163) with radius 12.
; PLAN: r0=308(x), r1=163(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 163
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
