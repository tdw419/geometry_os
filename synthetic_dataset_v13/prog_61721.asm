; DESCRIPTION: Renders a green disk with center (99, 124) and radius 14.
; PLAN: r0=99(x), r1=124(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 124
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
