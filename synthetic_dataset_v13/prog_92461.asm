; DESCRIPTION: Renders a green disk with center (123, 76) and radius 57.
; PLAN: r0=123(x), r1=76(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 76
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
