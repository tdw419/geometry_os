; DESCRIPTION: Creates a yellow circular shape at (154, 77) with radius 63.
; PLAN: r0=154(x), r1=77(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 77
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
