; DESCRIPTION: Renders a orange disk with center (151, 129) and radius 71.
; PLAN: r0=151(x), r1=129(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 129
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
