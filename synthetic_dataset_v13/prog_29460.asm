; DESCRIPTION: Renders a white disk with center (360, 187) and radius 36.
; PLAN: r0=360(x), r1=187(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 187
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
