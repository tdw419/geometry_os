; DESCRIPTION: Creates a magenta circular shape at (308, 112) with radius 38.
; PLAN: r0=308(x), r1=112(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 112
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
