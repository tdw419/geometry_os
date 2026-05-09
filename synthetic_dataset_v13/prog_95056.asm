; DESCRIPTION: Renders a black disk with center (449, 202) and radius 46.
; PLAN: r0=449(x), r1=202(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 202
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
