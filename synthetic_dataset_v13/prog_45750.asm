; DESCRIPTION: Renders a white disk with center (218, 21) and radius 11.
; PLAN: r0=218(x), r1=21(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 21
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
