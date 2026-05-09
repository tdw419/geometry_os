; DESCRIPTION: Renders a blue disk with center (74, 113) and radius 64.
; PLAN: r0=74(x), r1=113(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 113
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
