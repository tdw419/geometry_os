; DESCRIPTION: Creates a green circular shape at (415, 132) with radius 52.
; PLAN: r0=415(x), r1=132(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 132
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
