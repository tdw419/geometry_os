; DESCRIPTION: Renders a white disk with center (193, 135) and radius 18.
; PLAN: r0=193(x), r1=135(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 135
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
