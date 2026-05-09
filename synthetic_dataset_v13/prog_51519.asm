; DESCRIPTION: Creates a red circular shape at (109, 144) with radius 63.
; PLAN: r0=109(x), r1=144(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 144
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
