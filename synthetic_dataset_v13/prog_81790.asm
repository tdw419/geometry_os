; DESCRIPTION: Renders a red disk with center (422, 222) and radius 18.
; PLAN: r0=422(x), r1=222(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 222
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
