; DESCRIPTION: Renders a yellow disk with center (333, 191) and radius 36.
; PLAN: r0=333(x), r1=191(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 191
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
