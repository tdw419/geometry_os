; DESCRIPTION: Renders a black disk with center (279, 59) and radius 19.
; PLAN: r0=279(x), r1=59(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 59
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
