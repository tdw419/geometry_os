; DESCRIPTION: Creates a magenta circular shape at (347, 111) with radius 64.
; PLAN: r0=347(x), r1=111(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 111
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
