; DESCRIPTION: Renders a yellow disk with center (414, 59) and radius 56.
; PLAN: r0=414(x), r1=59(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 59
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
