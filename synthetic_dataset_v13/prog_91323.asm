; DESCRIPTION: Creates a yellow circular shape at (215, 94) with radius 55.
; PLAN: r0=215(x), r1=94(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 94
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
