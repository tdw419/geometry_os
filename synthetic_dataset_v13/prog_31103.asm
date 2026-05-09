; DESCRIPTION: Renders a white disk with center (117, 193) and radius 54.
; PLAN: r0=117(x), r1=193(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 193
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
