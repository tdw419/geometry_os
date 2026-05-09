; DESCRIPTION: Creates a magenta circular shape at (237, 112) with radius 40.
; PLAN: r0=237(x), r1=112(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 112
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
