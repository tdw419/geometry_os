; DESCRIPTION: Renders a yellow disk with center (174, 148) and radius 69.
; PLAN: r0=174(x), r1=148(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 148
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
