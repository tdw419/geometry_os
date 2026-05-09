; DESCRIPTION: Creates a orange circular shape at (113, 94) with radius 44.
; PLAN: r0=113(x), r1=94(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 94
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
