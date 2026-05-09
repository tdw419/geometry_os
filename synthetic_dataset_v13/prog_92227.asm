; DESCRIPTION: Creates a yellow circular shape at (464, 144) with radius 11.
; PLAN: r0=464(x), r1=144(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 144
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
