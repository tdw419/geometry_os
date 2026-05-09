; DESCRIPTION: Renders a blue disk with center (313, 46) and radius 18.
; PLAN: r0=313(x), r1=46(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 46
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
