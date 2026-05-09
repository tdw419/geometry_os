; DESCRIPTION: Creates a magenta circular shape at (275, 79) with radius 63.
; PLAN: r0=275(x), r1=79(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 79
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
