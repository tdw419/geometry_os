; DESCRIPTION: Renders a white disk with center (298, 54) and radius 35.
; PLAN: r0=298(x), r1=54(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 54
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
