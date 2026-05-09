; DESCRIPTION: Renders a yellow disk with center (268, 40) and radius 31.
; PLAN: r0=268(x), r1=40(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 40
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
