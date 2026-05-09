; DESCRIPTION: Renders a orange disk with center (356, 129) and radius 10.
; PLAN: r0=356(x), r1=129(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 129
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
