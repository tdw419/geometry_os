; DESCRIPTION: Renders a yellow disk with center (154, 191) and radius 43.
; PLAN: r0=154(x), r1=191(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 191
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
