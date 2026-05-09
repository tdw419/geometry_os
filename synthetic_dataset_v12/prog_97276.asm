; DESCRIPTION: Renders a white disk with center (391, 46) and radius 33.
; PLAN: r0=391(x), r1=46(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 46
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
