; DESCRIPTION: Creates a yellow circular shape at (424, 126) with radius 50.
; PLAN: r0=424(x), r1=126(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 126
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
