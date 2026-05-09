; DESCRIPTION: Renders a white disk with center (59, 113) and radius 24.
; PLAN: r0=59(x), r1=113(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 113
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
