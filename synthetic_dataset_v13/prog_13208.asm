; DESCRIPTION: Renders a white disk with center (174, 108) and radius 20.
; PLAN: r0=174(x), r1=108(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 108
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
