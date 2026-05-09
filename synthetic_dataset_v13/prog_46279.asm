; DESCRIPTION: Renders a black disk with center (428, 128) and radius 41.
; PLAN: r0=428(x), r1=128(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 128
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
