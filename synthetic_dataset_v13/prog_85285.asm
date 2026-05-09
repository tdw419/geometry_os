; DESCRIPTION: Creates a magenta circular shape at (372, 229) with radius 10.
; PLAN: r0=372(x), r1=229(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 229
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
