; DESCRIPTION: Creates a magenta circular shape at (352, 188) with radius 33.
; PLAN: r0=352(x), r1=188(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 188
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
