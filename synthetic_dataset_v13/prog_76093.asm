; DESCRIPTION: Renders a black disk with center (362, 50) and radius 21.
; PLAN: r0=362(x), r1=50(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 50
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
