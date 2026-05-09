; DESCRIPTION: Renders a white disk with center (220, 124) and radius 26.
; PLAN: r0=220(x), r1=124(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 124
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
