; DESCRIPTION: Creates a magenta circular shape at (91, 193) with radius 31.
; PLAN: r0=91(x), r1=193(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 193
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
