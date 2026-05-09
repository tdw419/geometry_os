; DESCRIPTION: Creates a magenta circular shape at (164, 152) with radius 80.
; PLAN: r0=164(x), r1=152(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 152
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
