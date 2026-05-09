; DESCRIPTION: Creates a yellow circular shape at (221, 83) with radius 50.
; PLAN: r0=221(x), r1=83(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 83
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
