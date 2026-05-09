; DESCRIPTION: Renders a orange disk with center (176, 141) and radius 30.
; PLAN: r0=176(x), r1=141(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 141
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
