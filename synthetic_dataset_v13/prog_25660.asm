; DESCRIPTION: Renders a black disk with center (166, 129) and radius 38.
; PLAN: r0=166(x), r1=129(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 129
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
