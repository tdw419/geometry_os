; DESCRIPTION: Creates a yellow circular shape at (314, 50) with radius 50.
; PLAN: r0=314(x), r1=50(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 50
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
