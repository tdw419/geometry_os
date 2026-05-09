; DESCRIPTION: Renders a white disk with center (460, 55) and radius 29.
; PLAN: r0=460(x), r1=55(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 55
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
