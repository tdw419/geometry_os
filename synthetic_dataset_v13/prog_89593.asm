; DESCRIPTION: Creates a yellow circular shape at (210, 120) with radius 58.
; PLAN: r0=210(x), r1=120(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 120
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
