; DESCRIPTION: Renders a yellow disk with center (69, 37) and radius 15.
; PLAN: r0=69(x), r1=37(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 37
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
