; DESCRIPTION: Renders a white disk with center (385, 173) and radius 62.
; PLAN: r0=385(x), r1=173(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 173
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
