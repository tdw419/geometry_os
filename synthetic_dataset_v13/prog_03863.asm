; DESCRIPTION: Creates a green circular shape at (202, 85) with radius 39.
; PLAN: r0=202(x), r1=85(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 85
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
