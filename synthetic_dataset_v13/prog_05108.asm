; DESCRIPTION: Creates a yellow circular shape at (374, 64) with radius 61.
; PLAN: r0=374(x), r1=64(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 64
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
