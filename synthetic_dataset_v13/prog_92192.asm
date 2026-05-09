; DESCRIPTION: Renders a white disk with center (180, 64) and radius 41.
; PLAN: r0=180(x), r1=64(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 64
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
