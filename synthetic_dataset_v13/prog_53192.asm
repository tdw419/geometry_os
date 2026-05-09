; DESCRIPTION: Renders a orange disk with center (237, 129) and radius 73.
; PLAN: r0=237(x), r1=129(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 129
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
