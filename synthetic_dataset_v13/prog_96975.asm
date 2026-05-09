; DESCRIPTION: Creates a green circular shape at (103, 47) with radius 43.
; PLAN: r0=103(x), r1=47(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 47
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
