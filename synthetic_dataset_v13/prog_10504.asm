; DESCRIPTION: Renders a yellow disk with center (303, 178) and radius 53.
; PLAN: r0=303(x), r1=178(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 178
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
