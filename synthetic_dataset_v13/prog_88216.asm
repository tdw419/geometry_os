; DESCRIPTION: Renders a orange disk with center (422, 168) and radius 75.
; PLAN: r0=422(x), r1=168(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 168
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
