; DESCRIPTION: Renders a orange disk with center (297, 151) and radius 68.
; PLAN: r0=297(x), r1=151(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 151
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
