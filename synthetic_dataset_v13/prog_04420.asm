; DESCRIPTION: Renders a black disk with center (350, 150) and radius 74.
; PLAN: r0=350(x), r1=150(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 150
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
