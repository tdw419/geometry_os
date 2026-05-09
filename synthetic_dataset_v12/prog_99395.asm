; DESCRIPTION: Renders a white disk with center (428, 101) and radius 70.
; PLAN: r0=428(x), r1=101(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 101
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
