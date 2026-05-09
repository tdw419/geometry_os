; DESCRIPTION: Creates a magenta circular shape at (492, 206) with radius 19.
; PLAN: r0=492(x), r1=206(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 492
LDI r1, 206
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
