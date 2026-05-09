; DESCRIPTION: Creates a green circular shape at (210, 202) with radius 37.
; PLAN: r0=210(x), r1=202(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 202
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
