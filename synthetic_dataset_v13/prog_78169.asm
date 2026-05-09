; DESCRIPTION: Creates a green circular shape at (158, 111) with radius 23.
; PLAN: r0=158(x), r1=111(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 111
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
