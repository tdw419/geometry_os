; DESCRIPTION: Renders a orange disk with center (178, 129) and radius 58.
; PLAN: r0=178(x), r1=129(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 129
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
