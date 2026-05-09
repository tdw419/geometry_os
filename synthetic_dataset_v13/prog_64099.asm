; DESCRIPTION: Renders a white disk with center (428, 140) and radius 49.
; PLAN: r0=428(x), r1=140(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 140
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
