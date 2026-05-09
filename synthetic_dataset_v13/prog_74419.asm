; DESCRIPTION: Creates a yellow circular shape at (214, 45) with radius 21.
; PLAN: r0=214(x), r1=45(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 45
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
