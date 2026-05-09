; DESCRIPTION: Renders a orange disk with center (455, 129) and radius 17.
; PLAN: r0=455(x), r1=129(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 129
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
