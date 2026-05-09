; DESCRIPTION: Creates a green circular shape at (355, 82) with radius 72.
; PLAN: r0=355(x), r1=82(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 82
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
