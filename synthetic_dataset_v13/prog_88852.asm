; DESCRIPTION: Renders a black disk with center (386, 150) and radius 73.
; PLAN: r0=386(x), r1=150(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 150
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
