; DESCRIPTION: Renders a black disk with center (307, 52) and radius 46.
; PLAN: r0=307(x), r1=52(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 52
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
