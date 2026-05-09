; DESCRIPTION: Renders a white disk with center (272, 159) and radius 12.
; PLAN: r0=272(x), r1=159(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 159
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
