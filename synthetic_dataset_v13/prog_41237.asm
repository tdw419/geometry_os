; DESCRIPTION: Creates a orange circular shape at (415, 144) with radius 39.
; PLAN: r0=415(x), r1=144(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 144
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
