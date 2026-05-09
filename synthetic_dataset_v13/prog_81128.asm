; DESCRIPTION: Creates a green circular shape at (445, 76) with radius 36.
; PLAN: r0=445(x), r1=76(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 76
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
