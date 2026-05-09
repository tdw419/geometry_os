; DESCRIPTION: Renders a orange disk with center (297, 111) and radius 76.
; PLAN: r0=297(x), r1=111(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 111
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
