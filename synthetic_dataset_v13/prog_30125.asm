; DESCRIPTION: Creates a yellow circular shape at (464, 94) with radius 38.
; PLAN: r0=464(x), r1=94(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 94
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
