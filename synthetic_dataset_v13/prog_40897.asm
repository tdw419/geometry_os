; DESCRIPTION: Creates a yellow circular shape at (84, 126) with radius 45.
; PLAN: r0=84(x), r1=126(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 126
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
