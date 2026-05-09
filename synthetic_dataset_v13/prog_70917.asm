; DESCRIPTION: Renders a orange disk with center (422, 151) and radius 16.
; PLAN: r0=422(x), r1=151(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 151
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
