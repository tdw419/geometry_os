; DESCRIPTION: Creates a green circular shape at (90, 71) with radius 43.
; PLAN: r0=90(x), r1=71(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 71
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
