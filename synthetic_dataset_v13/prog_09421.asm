; DESCRIPTION: Renders a yellow disk with center (381, 178) and radius 20.
; PLAN: r0=381(x), r1=178(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 178
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
