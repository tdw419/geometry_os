; DESCRIPTION: Renders a white disk with center (447, 200) and radius 50.
; PLAN: r0=447(x), r1=200(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 200
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
