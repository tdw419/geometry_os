; DESCRIPTION: Creates a orange circular shape at (192, 111) with radius 60.
; PLAN: r0=192(x), r1=111(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 111
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
