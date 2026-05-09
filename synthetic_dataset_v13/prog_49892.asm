; DESCRIPTION: Renders a white disk with center (99, 126) and radius 70.
; PLAN: r0=99(x), r1=126(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 126
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
