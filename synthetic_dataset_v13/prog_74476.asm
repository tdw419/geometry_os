; DESCRIPTION: Creates a yellow circular shape at (320, 145) with radius 52.
; PLAN: r0=320(x), r1=145(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 145
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
