; DESCRIPTION: Renders a yellow disk with center (23, 16) and radius 14.
; PLAN: r0=23(x), r1=16(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 23
LDI r1, 16
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
