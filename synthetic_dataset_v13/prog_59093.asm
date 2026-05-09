; DESCRIPTION: Creates a green circular shape at (277, 163) with radius 19.
; PLAN: r0=277(x), r1=163(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 163
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
