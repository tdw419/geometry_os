; DESCRIPTION: Creates a white circular shape at (63, 188) with radius 63.
; PLAN: r0=63(x), r1=188(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 188
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
