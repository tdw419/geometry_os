; DESCRIPTION: Renders a white disk with center (165, 68) and radius 56.
; PLAN: r0=165(x), r1=68(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 68
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
