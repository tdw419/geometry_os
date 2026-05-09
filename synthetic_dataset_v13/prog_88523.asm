; DESCRIPTION: Renders a yellow disk with center (23, 59) and radius 18.
; PLAN: r0=23(x), r1=59(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 23
LDI r1, 59
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
