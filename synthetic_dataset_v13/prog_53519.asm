; DESCRIPTION: Renders a red disk with center (422, 45) and radius 35.
; PLAN: r0=422(x), r1=45(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 45
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
