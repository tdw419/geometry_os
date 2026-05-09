; DESCRIPTION: Renders a yellow disk with center (372, 52) and radius 27.
; PLAN: r0=372(x), r1=52(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 52
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
