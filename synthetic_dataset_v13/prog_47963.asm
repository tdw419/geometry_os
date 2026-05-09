; DESCRIPTION: Creates a green circular shape at (342, 161) with radius 47.
; PLAN: r0=342(x), r1=161(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 161
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
