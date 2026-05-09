; DESCRIPTION: Creates a magenta circular shape at (352, 144) with radius 66.
; PLAN: r0=352(x), r1=144(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 144
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
