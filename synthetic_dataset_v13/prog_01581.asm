; DESCRIPTION: Renders a black disk with center (259, 187) and radius 50.
; PLAN: r0=259(x), r1=187(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 187
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
