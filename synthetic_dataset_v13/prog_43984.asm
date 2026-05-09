; DESCRIPTION: Renders a white disk with center (240, 60) and radius 46.
; PLAN: r0=240(x), r1=60(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 60
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
