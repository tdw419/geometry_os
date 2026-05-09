; DESCRIPTION: Renders a white disk with center (298, 100) and radius 42.
; PLAN: r0=298(x), r1=100(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 100
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
