; DESCRIPTION: Renders a blue disk with center (239, 113) and radius 10.
; PLAN: r0=239(x), r1=113(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 113
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
