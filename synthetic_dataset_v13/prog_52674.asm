; DESCRIPTION: Renders a purple disk with center (400, 117) and radius 78.
; PLAN: r0=400(x), r1=117(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 117
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
