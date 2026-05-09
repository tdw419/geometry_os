; DESCRIPTION: Creates a magenta circular shape at (403, 176) with radius 48.
; PLAN: r0=403(x), r1=176(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 176
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
