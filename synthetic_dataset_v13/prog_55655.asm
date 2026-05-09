; DESCRIPTION: Creates a magenta circular shape at (364, 206) with radius 20.
; PLAN: r0=364(x), r1=206(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 206
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
