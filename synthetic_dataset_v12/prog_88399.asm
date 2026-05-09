; DESCRIPTION: Creates a yellow circular shape at (81, 185) with radius 42.
; PLAN: r0=81(x), r1=185(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 185
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
