; DESCRIPTION: Renders a yellow disk with center (128, 204) and radius 10.
; PLAN: r0=128(x), r1=204(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 204
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
