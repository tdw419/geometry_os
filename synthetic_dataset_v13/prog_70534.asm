; DESCRIPTION: Creates a yellow circular shape at (480, 64) with radius 16.
; PLAN: r0=480(x), r1=64(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 64
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
