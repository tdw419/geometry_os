; DESCRIPTION: Renders a yellow disk with center (326, 59) and radius 23.
; PLAN: r0=326(x), r1=59(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 59
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
