; DESCRIPTION: Renders a white disk with center (395, 115) and radius 40.
; PLAN: r0=395(x), r1=115(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 115
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
