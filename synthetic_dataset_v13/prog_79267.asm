; DESCRIPTION: Creates a yellow circular shape at (403, 134) with radius 63.
; PLAN: r0=403(x), r1=134(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 134
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
